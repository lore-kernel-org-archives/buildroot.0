From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Aug 2019 12:11:10 +0200
Subject: [Buildroot] [PATCHv3] package/libcurl: introduce options to
 extend/reduce feature set
In-Reply-To: <20190208212311.29304-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Fri, 8 Feb 2019 22:23:11 +0100")
References: <20190208212311.29304-1-patrickdepinguin@gmail.com>
Message-ID: <87k1bt2qbl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Libcurl is more than 250 KiB (libcurl) / 100 KiB (curl binary) in size.
 > About 50 KiB / 15 KiB of this can be saved by disabling features/protocols
 > that are not commonly needed:

 > - proxy support: 15 KiB
 > - cookies support: 10 KiB
 > - various less common protocols: 25 KiB (libcurl) + 15 KiB (curl binary)

 > Note that the exact amount of space saved depends on the architecture,
 > toolchain, and other factors (for example the 'extra' set enables the
 > --libcurl option which only has impact on the curl binary).

 > Other packages that are selecting libcurl might require protocols from the
 > 'extra' set. But, there is no clear way to find out which packages are in
 > this situation, in particular because issues may only be visible at runtime.

 > Note: remove the text 'enable' on the option for 'verbose strings' as that
 > is more common in Buildroot.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > ---
 >  package/libcurl/Config.in  | 30 ++++++++++++++++++++++++++-
 >  package/libcurl/libcurl.mk | 42 ++++++++++++++++++++++++++++++++++++++
 >  2 files changed, 71 insertions(+), 1 deletion(-)


 > v3: (feedback Peter Korsgaard)
 > - change from negative 'reduce' option to positive 'enable extra'.

Sorry for the slow response. Committed, thanks.

I did change it to unconditionally disable the libcurl-option as we
don't support a C compiler on the target, and the option adds quite some
space (~16K).

-- 
Bye, Peter Korsgaard
