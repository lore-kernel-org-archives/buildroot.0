From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Jun 2016 22:25:24 +0200
Subject: [Buildroot] [PATCH 1/5] wireshark: remove documentation
In-Reply-To: <20160614193321.GA3759@free.fr> (Yann E. MORIN's message of "Tue, 
 14 Jun 2016 21:33:21 +0200")
References: <20160614151017.GG3060@hermes.click-hack.org>
 <1465917079-30473-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <20160614193321.GA3759@free.fr>
Message-ID: <87fusfv7pn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> +define WIRESHARK_REMOVE_DOCS
 >> +	find $(TARGET_DIR)/usr/share/wireshark -\( -name '*.txt' -o -name '*.html' -\) -delete

 > My busybox' find does not like:

 >   - '-(' ')-' : it is not POSIX, is not even talked about in the find
 >     manpage. It's a GNUism.

 >   - -delete : it is disabled in our default busybox configuration

With that said, I've changed it to use xargs:

find $(TARGET_DIR)/usr/share/wireshark -name '*.txt' -o '*.html' -print0 \
        | xargs -0 rm -f

-- 
Bye, Peter Korsgaard
