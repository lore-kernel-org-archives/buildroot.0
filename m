From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Oct 2016 14:57:43 +0200
Subject: [Buildroot] [PATCH 02/30] toolchain-external: pass CC and
 CFLAGS as arguments
In-Reply-To: <20161025144843.24d86639@free-electrons.com>
References: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
 <1477255711-28603-3-git-send-email-romain.naour@gmail.com>
 <d9ace2a7-d062-64a3-fe7d-9afeb4adec42@mind.be>
 <20161025134411.12a91a7d@free-electrons.com>
 <d5b1eb4e-5451-dc97-1a62-70ddb2898ae9@mind.be>
 <20161025144843.24d86639@free-electrons.com>
Message-ID: <8cd79a3d-6d78-de81-d2bb-de4d5e890206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-10-16 14:48, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 25 Oct 2016 14:46:01 +0200, Arnout Vandecappelle wrote:
> 
>>>  toolchain-external: TOOLCHAIN_EXTERNAL_CREATE_*_LIB_SYMLINK: use arguments instead of global variables
>>>  toolchain-external: TOOLCHAIN_EXTERNAL_INSTALL_*_LIBS: use arguments instead of global variables
>>>  toolchain-external: TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER: use arguments instead of global variables
>>>  toolchain-external: TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER: use arguments instead of global variables
>>>
>>> I find this split a lot more logical than a split by argument being
>>> added, as the latter would mean a given function gets modified in two
>>> different patches.  
>>
>>  Sure, but then it would have been 4 patches instead of 2. The way it was split
>> up now was completely illogical IMHO.
> 
> There are four patches in the current patch series:
> 
>   toolchain-external: pass CC and CFLAGS as arguments
>   toolchain-external: pass CC and CFLAGS as arguments
>   toolchain-external: pass arguments CROSS to install wrapper
>   toolchain-external: pass arguments CC, CFLAGS, INSTALL_DIR while
>     installing gdbserver
> 
> They are split *exactly* like I said above, except that their commit
> title and description are not very good.

 I'm sorry, I was reading this mail to quickly, I only looked at
TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT in the second patch and didn't
notice the relation with TOOLCHAIN_EXTERNAL_INSTALL_*_LIBS (it is really
installing libs, just not called _LIBS because the name is very long already I
guess).

 I agree with the current split and your renaming.

 Regards,
 Arnout

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
