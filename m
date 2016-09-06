From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Sep 2016 22:40:58 +0200
Subject: [Buildroot] [PATCH 6/6] gtest: retrieve package from github
In-Reply-To: <2126371293.3550600.1473170292030.JavaMail.zimbra@datacom.ind.br>
References: <1472660696-21640-1-git-send-email-fabrice.fontaine@orange.com>
 <2126371293.3550600.1473170292030.JavaMail.zimbra@datacom.ind.br>
Message-ID: <96c748a7-e46e-fce4-f4f1-9271928e3468@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-09-16 15:58, Carlos Santos wrote:
>> From: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>
>> To: buildroot at buildroot.org
>> Cc: "Fabrice Fontaine" <fabrice.fontaine@orange.com>
>> Sent: Wednesday, August 31, 2016 1:24:56 PM
>> Subject: [Buildroot] [PATCH 6/6] gtest: retrieve package from github
> 
>> https://googletest.googlecode.com/files is no more available, so update
>> gtest.mk and gtest.hash to retrieve googletest source code as a tar.gz
>> (and not a zip) from github as https://googletest.googlecode.com is now
>> a redirection to https://github.com/google/googletest.
>>
>> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
[snip]
> GMock needs to be fixed too. I attempted to do this before (http://patchwork.ozlabs.org/patch/586130/) but it was refused, unfortunately.

 Quoting Yann from that patchwork entry:
> As I understand it, gtest and gmock are being phased out as separate
> packages, and are to be replaced with the googletest package.
> 
> So why don't we directly add "googletest" and get rid of gtest and
> gmock, rather than fix them to eventually get rid of them?

 In that contet, I think it's a sane idea to have this commit as a first step,
and do the bump to v1.8.0 (which implies merging gtest and gmock) in a second step.

 Fabrice, care to work on that? If you do, here are some tips:

- GMOCK should become a suboption of GTEST: BR2_PACKAGE_GTEST_GMOCK.
- A legacy entry should be added for it.
- gmock now has a usable cmake and builds gtest implicitly.
- host-gmock is tricky - but perhaps it's no longer needed.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
