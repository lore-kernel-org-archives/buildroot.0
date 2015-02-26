From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Feb 2015 22:58:12 +0100
Subject: [Buildroot] [PATCH v2] libgtk2: skip tutorial and faq build
In-Reply-To: <20150226173525.GA3914@free.fr> (Yann E. MORIN's message of "Thu, 
 26 Feb 2015 18:35:25 +0100")
References: <20150224235024.844FBE0447@smtp.hushmail.com>
 <877fv57f9j.fsf@dell.be.48ers.dk> <20150226173525.GA3914@free.fr>
Message-ID: <87d24w5o97.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> > + AC_CHECK_PROG(DB2HTML, db2html, true, false)
 >> > +-AM_CONDITIONAL(HAVE_DOCBOOK, $DB2HTML)
 >> > ++AM_CONDITIONAL([HAVE_DOCBOOK], [test ! "$DB2HTML" = "no"])
 >> 
 >> Why not just pass DB2HTML=false in LIBGTK2_CONF_ENV?

 > Weird, I was under the impression I did try that and that it did not
 > work... But Justin is reporting that it does work, so my memory are
 > obviously flawed...

Yes, as far as I can see AC_CHECK_PROG directly uses the shell variable
if defined:

https://www.gnu.org/software/autoconf/manual/autoconf-2.68/html_node/Generic-Programs.html

$DB2HTML directly expands to false, so AM_CONDITIONAL isn't true:

https://www.gnu.org/software/automake/manual/html_node/Usage-of-Conditionals.html

 >> What does that buy us? gtk-doc is disabled unless --enable-gtk-doc
 >> is passed (which we don't), so these shouldn't change anything.

 > Fact is, documentation is still generated even with
 > --disable-gtk-doc.

Really? That's not what I saw during my tests.

-- 
Venlig hilsen,
Peter Korsgaard 
