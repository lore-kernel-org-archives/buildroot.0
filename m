From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 03 Mar 2014 07:42:13 +0100
Subject: [Buildroot] [PATCH] vlc: avoid that AUTORECONF renames
 configure's arguments
In-Reply-To: <20140301145442.7e99ba17@skate>
References: <1393529854-27070-1-git-send-email-arnout@mind.be>
 <20140301145442.7e99ba17@skate>
Message-ID: <53142445.9040006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/03/14 14:54, Thomas Petazzoni wrote:
> Arnout,
> 
> On Thu, 27 Feb 2014 20:37:34 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> VLC defines two autoconf functions which are also defined by our own
>> pkg.m4 from pkgconf. Unfortunately, they are defined in a different way:
>> VLC adds --enable- options, but pkg.m4 adds --with- options. To make
>> sure we use VLC's definition, rename these two functions from
>> PKG_WITH_MODULES to VLC_PKG_WITH_MODULES and from PKG_HAVE_WITH_MODULES
>> to VLC_PKG_HAVE_WITH_MODULES.
>>
>> Note that the second function (PKG_HAVE_WITH_MODULES) is in fact
>> defined in exactly the same way by VLC and pkgconf, but this might no
>> longer be the case when either pkgconf or VLC is updated. Therefore,
>> that one is renamed as well.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>> I propose to apply this to next but not to master - Simon's patch 02004773
>> has been applied to master and fixes it as well. However, that means that
>> 02004773 has to be reverted when next is merged into master.
> 
> Thanks, patch applied, after reverting 02004773. Please let me know if
> the revert was correct, as there was a minor conflict with some udev
> related changes.

 Looks good to me. Autobuilders will tell us if it's not.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
