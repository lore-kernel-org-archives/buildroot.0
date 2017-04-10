From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 10:46:54 +0200
Subject: [Buildroot] [PATCH/autobuild 4/8] autobuild-run: remove
 redundant 'make oldconfig'
In-Reply-To: <20170410102550.224313e7@free-electrons.com>
References: <20170409205128.11560-1-arnout@mind.be>
 <20170409205128.11560-4-arnout@mind.be>
 <20170410102550.224313e7@free-electrons.com>
Message-ID: <4d4d06b2-9b8f-b95a-40be-d9478787dd33@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-04-17 10:25, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 9 Apr 2017 22:51:24 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> After running 'make randpackageconfig', and additional 'make oldconfig'
>> is done. However, this is redundant, since randpackageconfig already
>> does an olddefconfig.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> Well, this oldconfig is not exactly right after randpackageconfig.
> 
> We do this:
> 
>  - randpackageconfig
>  - fixup_config()
>  - oldconfig
> 
> The fixup_config() function potentially does some changes to
> the .config file, and that's why we re-run oldconfig afterwards. This
> ensures that the build will not wait indefinitely while asking the user
> the value of a config option.

 D'oh, I missed that. Fortunately somebody reviews my crap! :-)

 So instead I'll replace it with olddefconfig and squash with the preceding
patch, OK?

 Regards,
 Arnout

> 
> Therefore, I wouldn't qualify this oldconfig as "redundant".
> 
> Best regards,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
