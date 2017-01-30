From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 16:18:25 +0100
Subject: [Buildroot] [PATCH v2,1/1] lxc: add dependency on gnutls
In-Reply-To: <1482161178-20667-1-git-send-email-fabrice.fontaine@orange.com>
 (Fabrice Fontaine's message of "Mon, 19 Dec 2016 16:26:18 +0100")
References: <1482161178-20667-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <87a8a88tku.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > lxc can use gnutls for various checksumming so add a dependency on it if
 > package is selected

 > Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Get upstream patch that add --enable-gnutls option

Committed, thanks. I see upstream has releases 2.0.7 so it would be nice
to update to that and get rid of autoreconf.

I also noticed that your patch hardcodes -lgnutls instead of using
pkg-config to figure out the exact libraries needed. With lxc not
allowing static linking this it probably good enough, but it would have
been nicer to do it "right".

-- 
Bye, Peter Korsgaard
