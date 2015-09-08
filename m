From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Tue, 08 Sep 2015 15:01:34 +0200
Subject: [Buildroot]
 =?utf-8?q?=5BPATCH=5D_Makefile=3A_Remove_KBUILD=5FVER?=
 =?utf-8?q?BOSE_and_quiet?=
In-Reply-To: <55EED4CA.3040304@mind.be>
References: <1441658846-5786-1-git-send-email-cedric.marie@openmailbox.org>
 <55EDFE3E.8030205@mind.be>
 <d72ff365b4711836e5c1990f7b72923c@openmailbox.org>
 <55EED4CA.3040304@mind.be>
Message-ID: <0cef4a73d23345bbaf2f88905d0ed82f@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 2015-09-08 14:30, Arnout Vandecappelle a ?crit?:
>>> 1. Remove KBUILD_VERBOSE and quiet (this one will be uncontroversial 
>>> I think)
>>> 2. Define VERBOSE based on V= passed on command line
>>> 3. Use VERBOSE in autotools and cmake
>>> 4. Update documentation.

>  No, since VERBOSE already exists, my proposed step 2 is useless.

OK. Please note that I will change it a little bit:
- remove export VERBOSE
- VERBOSE=1 if V=1, even if VERBOSE is already defined (i.e. remove 
"ifndef VERBOSE" test)
- VERBOSE=0 if V=0
- VERBOSE=(empty) otherwise to prevent this variable from being 
inherited from the shell.

Regards,

-- 
C?dric
