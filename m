From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 4 Sep 2020 13:52:35 +0100
Subject: [Buildroot] [PATCH 1/3] package/libcamera: Prevent builds on
 m68k
In-Reply-To: <20200904145046.46cbb14c@windsurf.home>
References: <20200904095148.844292-1-kieran.bingham@ideasonboard.com>
 <20200904095148.844292-2-kieran.bingham@ideasonboard.com>
 <20200904145046.46cbb14c@windsurf.home>
Message-ID: <7162b8ae-d23e-803d-a884-92783a960978@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 04/09/2020 13:50, Thomas Petazzoni wrote:
> On Fri,  4 Sep 2020 10:51:45 +0100
> Kieran Bingham <kieran.bingham@ideasonboard.com> wrote:
> 
>> The ControlValue structure is currently defined with a 16-bit hole
>> (causing unaligned access to the numElements_ field, though that's a
>> separate topic).
>>
>> This structure has a static assertion to ensure that its size does not
>> change without due care, as it forms part of our ABI and is used in
>> Serialisation between the pipeline handlers and IPA componenents.
>>
>> The m68k architecture is the only target which fails this assertion,
>> which is likely because it can pack the structure more efficiently,
>> producing a different binary size.
>>
>> This is likely an area we will tackle before stabilising our ABI, but
>> until then, disable m68k builds as libcamera is not expected to be
>> supported on this target.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> We normally ask to have an autobuilder failure reference here. No need
> to resend just for that, we can add it when applying.

Sorry, I didn't realise. But don't worry -there are plenty ;-)

Here's the latest:


> Results for the '2020.08.x' branch
> ----------------------------------
> 
> Build failures related to your packages:
> 
>     arch     |             reason             |                                       url                                      
> -------------+--------------------------------+---------------------------------------------------------------------------------
>     m68k     | libcamera-96fab38e02792a109... | http://autobuild.buildroot.net/results/9dce26e94299a2c61bba60cbc7803926e2f85e29


-- 
Regards
--
Kieran
