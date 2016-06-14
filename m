From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Jun 2016 22:22:45 +0200
Subject: [Buildroot] [PATCH 1/5] wireshark: remove documentation
In-Reply-To: <20160614193321.GA3759@free.fr> (Yann E. MORIN's message of "Tue, 
 14 Jun 2016 21:33:21 +0200")
References: <20160614151017.GG3060@hermes.click-hack.org>
 <1465917079-30473-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <20160614193321.GA3759@free.fr>
Message-ID: <87k2hrv7u2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Gilles, All,
 > On 2016-06-14 17:11 +0200, Gilles Chanteperdrix spake thusly:
 >> Remove html and txt documentation from the rootfs as they unlikely to be
 >> needed.
 >> 
 >> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
 >> ---
 >> package/wireshark/wireshark.mk | 6 ++++++
 >> 1 file changed, 6 insertions(+)
 >> 
 >> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
 >> index c7bf6c2..23996a3 100644
 >> --- a/package/wireshark/wireshark.mk
 >> +++ b/package/wireshark/wireshark.mk
 >> @@ -99,4 +99,10 @@ else
 >> WIRESHARK_CONF_OPTS += --with-sbc=no
 >> endif
 >> 
 >> +define WIRESHARK_REMOVE_DOCS
 >> +	find $(TARGET_DIR)/usr/share/wireshark -\( -name '*.txt' -o -name '*.html' -\) -delete

 > My busybox' find does not like:

 >   - '-(' ')-' : it is not POSIX, is not even talked about in the find
 >     manpage. It's a GNUism.

 >   - -delete : it is disabled in our default busybox configuration

I agree to stick to posix where possible / sensible, but Are you really
*building* on a busybox based system?

-- 
Bye, Peter Korsgaard
