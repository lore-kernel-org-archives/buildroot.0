From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Oct 2016 14:46:01 +0200
Subject: [Buildroot] [PATCH 02/30] toolchain-external: pass CC and
 CFLAGS as arguments
In-Reply-To: <20161025134411.12a91a7d@free-electrons.com>
References: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
 <1477255711-28603-3-git-send-email-romain.naour@gmail.com>
 <d9ace2a7-d062-64a3-fe7d-9afeb4adec42@mind.be>
 <20161025134411.12a91a7d@free-electrons.com>
Message-ID: <d5b1eb4e-5451-dc97-1a62-70ddb2898ae9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-10-16 13:44, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 25 Oct 2016 13:07:01 +0200, Arnout Vandecappelle wrote:
> 
>>  This is exactly the same commit message as the previous commit. However, what
>> this patch actually does is
>>
>> 1. Pass up CC and CFLAGS one level more
>>  -> I think this should be squashed with the previous commit.  
>>
>> 2. pass LIBS as arguments
>>  -> This should be a separate commit, with the appropriate commit message.  
> 
> I believe Romain's idea is to split this per *function* (or family
> of functions) being changed, not per arguments being passed. So indeed,
> the wording of his commit titles and logs is not very good. It should
> have been:
> 
>  toolchain-external: TOOLCHAIN_EXTERNAL_CREATE_*_LIB_SYMLINK: use arguments instead of global variables
>  toolchain-external: TOOLCHAIN_EXTERNAL_INSTALL_*_LIBS: use arguments instead of global variables
>  toolchain-external: TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER: use arguments instead of global variables
>  toolchain-external: TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER: use arguments instead of global variables
> 
> I find this split a lot more logical than a split by argument being
> added, as the latter would mean a given function gets modified in two
> different patches.

 Sure, but then it would have been 4 patches instead of 2. The way it was split
up now was completely illogical IMHO.

 To make things easy, however, I'd just squash these two in a single commit.

 Regards,
 Arnout

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
