From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 15:14:16 +0100
Subject: [Buildroot] [PATCH] package/sqlcipher: add OpenSSL 1.1.x
 compatibility
In-Reply-To: <CANQCQpbkwrmsXzopxo+aqK8NTmce9YHoPdRfsa3BguOWeALJpw@mail.gmail.com>
 (Matthew Weber's message of "Tue, 12 Feb 2019 07:25:47 -0600")
References: <1549454958-648-1-git-send-email-matthew.weber@rockwellcollins.com>
 <87pnryvu39.fsf@dell.be.48ers.dk>
 <CANQCQpbkwrmsXzopxo+aqK8NTmce9YHoPdRfsa3BguOWeALJpw@mail.gmail.com>
Message-ID: <87zhr1um9z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

 > Peter,
 > On Mon, Feb 11, 2019 at 4:27 PM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >> >>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:
 >> 
 >> > Fixes
 >> > http://autobuild.buildroot.net/results/5e2/5e2c3178d8a6e11b1af1c37144737097730ba222/
 >> 
 >> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 >> > ---
 >> > Tested using autobuilder failure setup for libopenssl.
 >> 
 >> > For libressl the build fails. The sqlcipher pkg version really should
 >> > be bumped before investigating the build failure as there are a number
 >> > of commits that should be picked up.
 >> > Currently the pkg build won't pass the configure stage.
 >> > Should I open a bug for this or send something for "next"?
 >> 
 >> What do we do about the libressl issue for 2019.02? Just select
 >> BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL?
 >> 

 > I did some builds and this libressl compatibility was broken before
 > the openssl bump but never found.  (Tested with 2018.02.x and tip)

Ahh, ok.

 > I can add that force dependency for this release cycle.  Would it make
 > sense to open a bug capturing the notes and suggesting a bump or just
 > leave this limitation in until someone maintains the package
 > (currently we're at a ~2014 version with commits by Gustavo and
 > Maxime)?

Either that or just explain it in the commit message that adds the
select. I guess both will be visible for someone wanting to use
sqlcipher with libressl.

-- 
Bye, Peter Korsgaard
