From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 11 Apr 2013 16:54:36 +0200
Subject: [Buildroot] [PATCHv5 03/14] qt5base: adjust linux-buildroot-g++
	qmake.conf
In-Reply-To: <1365364648-30568-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 7 Apr 2013 21:57:17 +0200")
References: <1365364648-30568-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1365364648-30568-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bo9lungz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> In order for qmake to generate correct moc command lines, we need to
 Thomas> make sure INCLUDEPATH contains $(STAGING_DIR)/usr/include. To do so,
 Thomas> we add a new line in our custom qmake.conf.

 Thomas> Also, in order to clearly identify the Buildroot specific variables
 Thomas> from the qmake standard variables, we prefix all the custom Buildroot
 Thomas> variables by BUILDROOT_ in qmake.conf.

 Thomas> This solves compilation issues of qt5svg such as "Undefined
 Thomas> interface", due to the fact that moc isn't passed a -I path pointing
 Thomas> to the main header directory.

Committed, thanks.

-- 
Bye, Peter Korsgaard
