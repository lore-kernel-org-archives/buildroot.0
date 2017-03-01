From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 01 Mar 2017 22:41:15 +0000
Subject: [Buildroot] [Bug 9456] mkusers script bash errors
In-Reply-To: <bug-9456-163@https.bugs.busybox.net/>
References: <bug-9456-163@https.bugs.busybox.net/>
Message-ID: <bug-9456-163-YgrWSPnUsa@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9456

--- Comment #19 from Paul Stewart <paulstewartis@gmail.com> ---
(In reply to Yann E. MORIN from comment #18)

line='paul 1000 users 100
=21248f7aac088184a7c9dd3a3cd8bd1bafecc5718174e9025bab7053756a013a /home/paul
/bin/sh ssh-user'
  username='paul'
  uid     ='1000'
  group   ='users'
  gid     ='100'
  paswd   ='=21248f7aac088184a7c9dd3a3cd8bd1bafecc5718174e9025bab7053756a013a'
  home    ='/home/paul'
  shell   ='/bin/sh'
  groups  ='ssh-user'
  comment =''
line='git 1001 users 100
=de5d4f76680ec42ff304682eebeaec1c4756e3d5de3e4ce6db747cb223d6037c /home/git
/usr/bin/git-shell ssh-user'
  username='git'
  uid     ='1001'
  group   ='users'
  gid     ='100'
  paswd   ='=de5d4f76680ec42ff304682eebeaec1c4756e3d5de3e4ce6db747cb223d6037c'
  home    ='/home/git'
  shell   ='/usr/bin/git-shell'
  groups  ='ssh-user'
  comment =''
line='sshd -1 sshd -1 * - - - SSH drop priv user'
  username='sshd'
  uid     ='-1'
  group   ='sshd'
  gid     ='-1'
  paswd   ='*'
  home    ='-'
  shell   ='-'
  groups  ='-'
  comment ='SSH drop priv user'

This is immediately followed by:
/home/paul/src/buildroot/support/scripts/mkusers: line 407: [: -eq: unary
operator expected
/home/paul/src/buildroot/support/scripts/mkusers: line 432: [: -ge: unary
operator expected
/home/paul/src/buildroot/support/scripts/mkusers: line 441: [: -eq: unary
operator expected

And the paul user is not created.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
