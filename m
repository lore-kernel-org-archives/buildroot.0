From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 2 Jul 2017 15:54:00 +0200
Subject: [Buildroot] [PATCH 00/53] Eliminate $(HOST_DIR)/usr
In-Reply-To: <60e35247-7330-b27d-1932-7a48a6b55afa@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
 <60e35247-7330-b27d-1932-7a48a6b55afa@mind.be>
Message-ID: <CAHXCMMLFb3-phgoe5ExhBsQNxpcCMA8WbedMfxSES=7R8Pxdgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, all,

On Tue, Apr 18, 2017 at 11:49 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Hi all,
>
> On 12-04-17 11:38, Arnout Vandecappelle (Essensium/Mind) wrote:
>> We currently use $(HOST_DIR)/usr as the prefix for host packages. That
>> has a few disadvantages:
>>
>> - There are some things installed in $(HOST_DIR)/etc and
>>   $(HOST_DIR)/sbin, which is inconsistent.
>>
>> - To pack a buildroot-built toolchain into a tarball for use as an
>>   external toolchain, you have to pack output/host/usr instead of the
>>   more obvious output/host.
>>
>> - Because of the above, the internal toolchain wrapper breaks which
>>   forces us to work around it (call the actual toolchain executable
>>   directly). This is OK for us, but when used in another build system,
>>   that's a problem.
>>
>> - Paths are four characters longer.
>>
>> This series replaces all occurences of 'host/usr' (in its various forms)
>> with 'host', and updates relative paths accordingly.
> [snip]

Reviewed-by: Samuel Martin <s.martin49@gmail.com>


-- 
Samuel
