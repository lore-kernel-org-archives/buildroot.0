From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Feb 2016 00:45:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/libarchive: add optional
 support for bzip2
In-Reply-To: <sg7mpcxlr5.ln2@ID-313208.user.individual.net>
References: <1455137950-18164-1-git-send-email-bernd.kuhls@t-online.de>
 <1455137950-18164-2-git-send-email-bernd.kuhls@t-online.de>
 <56BBA94B.3000809@mind.be> <sg7mpcxlr5.ln2@ID-313208.user.individual.net>
Message-ID: <56C8FAB2.3010504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/20/16 14:49, Bernd Kuhls wrote:
> Am Wed, 10 Feb 2016 22:19:07 +0100 schrieb Arnout Vandecappelle:
> 
>>  No --with-bz2lib? If there is a good reason, mention it in the commit
>>  log.
> 
> Hi Arnout,
> 
> libarchive always checks for bzip2 unless --without-bz2lib is used:
> https://github.com/libarchive/libarchive/blob/master/configure.ac#L300
> 
> Therefore I see no need for --with-bz2lib and I also should not have 
> added --with-lzma as well, I will send a patch removing it along with v2 
> of this patch explaining why --with-bz2lib is not needed.

 We prefer to have both an explicit enable and disable (or with and without)
because:

- it makes it simpler in case the default changes after a version bump;

- it makes it easier for other people to understand that the right thing is done
(no need to check in configure what the default is);

- AFAIK the typical --enable/--with will give an error if the dependency is not
found, which gives an extra safety net;

- we do it like this in other places, it's nice to see the same pattern everywhere.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
