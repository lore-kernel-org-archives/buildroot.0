From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 May 2019 11:55:58 +0000
Subject: [Buildroot] [Bug 11831] python-pyparsing: "No module named
 'pyparsing'" on target / while building cantools
In-Reply-To: <bug-11831-163@https.bugs.busybox.net/>
References: <bug-11831-163@https.bugs.busybox.net/>
Message-ID: <bug-11831-163-s9PAIEh5tf@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11831

--- Comment #8 from Tibor Stolz <tistolz@outlook.de> ---
Created attachment 8046
  --> https://bugs.busybox.net/attachment.cgi?id=8046&action=edit
FIXED python-cantools/python-cantools.mk

Hi all,

The build error for python-cantools persisted, but now I figured out why I ran
into it: In order to build correctly, the build-time dependencies must be
installed on the *host*! Therefore, the package makefile (python-cantools.mk)
must be changed:

- PYTHON_CANTOOLS_DEPENDENCIES = python-bitstruct python-pyparsing
+ PYTHON_CANTOOLS_DEPENDENCIES = host-python-bitstruct host-python-pyparsing

Doing a 'grep -r DEPENDENCIES package/python-*' in the buildroot-2019.02.2
directory revealed that most python library dependencies are in the
host-python-* form. Maybe this should be mentioned in the Buildroot user
manual?

Best regards,
Tibor Stolz

-- 
You are receiving this mail because:
You are on the CC list for the bug.
