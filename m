From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 May 2014 10:34:37 +0200
Subject: [Buildroot] [PATCHv2] nodejs: fix build when python3 is
	selected in Buildroot
In-Reply-To: <1400657881-30959-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 21 May 2014 09:38:01 +0200")
References: <1400657881-30959-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ha4jfs2q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > When Python 3 is selected in Buildroot, the host/usr/bin/python
 > symlink of the host Python interpreter points to python3. Packages
 > that need to use the host Python 2 interpreter have to use python2.

 > In commit 40218a16526946f35dab0d05f379f71a01f29530 ("nodejs: force
 > python interpreter"), Samuel made some changes to the nodejs package
 > to use python2. One part of the changes is to sed a .gyp file to
 > replace the string 'python' by the path to python2. However, this
 > operation is done *after* calling the configure script, so it has in
 > fact no effect. Putting this sed before calling the configure script
 > fixes the problem.

 > However, there is a better solution: the nodejs build system has a
 > mechanism of variables, and it already defines a python variable
 > according to the environment variable PYTHON being passed. So this
 > patch instead adds a new patch to nodejs to use this python variable.

 > Fixes:

 >   http://autobuild.buildroot.org/results/aff/affd7300895ec400de50a33d51b4e94e15d63341/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 > Changes since v1:
 >  - Remove obsolete comment above host configure commands
 >  - Remove useless SED command in the target configure commands

Committed, thanks.

-- 
Bye, Peter Korsgaard
