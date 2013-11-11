From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Nov 2013 16:50:36 +0100
Subject: [Buildroot] [PATCH] icu: Doesn't work on ARC yet
In-Reply-To: <1384182468-18493-1-git-send-email-mjonker@synopsys.com> (Mischa
 Jonker's message of "Mon, 11 Nov 2013 16:07:48 +0100")
References: <1384182468-18493-1-git-send-email-mjonker@synopsys.com>
Message-ID: <8738n36ipf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mischa" == Mischa Jonker <Mischa.Jonker@synopsys.com> writes:

> icu depends on __sync_sub_and_fetch and other atomic primitives that
> don't exist in the ARC toolchain yet.

Thanks, but you also need to:

- Add the !arc dependency to the comment line belo
- Propagate the dependency to icu's reverse dependencies:
git grep -l 'select BR2_PACKAGE_ICU'
package/beecrypt/Config.in
package/cppcms/Config.in
package/php/Config.ext
package/qt5/qt5base/Config.in
package/webkit/Config.in

Care to fix that and resend?

-- 
Bye, Peter Korsgaard
