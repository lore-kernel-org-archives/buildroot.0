From: suffecool at comcast.net <suffecool@comcast.net>
Date: Tue, 14 Oct 2008 20:41:59 +0000
Subject: [Buildroot] cant' seem to turn off uClibc errno and signum messages
Message-ID: <101420082041.25631.48F50417000954830000641F22070245530401010C0A00009A9C@comcast.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Can anyone explain to me why turning off both "errno message text" and "signum message text" within uClibc doesn't work?  Turning them off and recompiling doesn't change the size of my generated libuClibc-0.9.29.so file, and running "strings" on this library file shows that the error and signum messages are indeed still there.  The help doc seems to say that turning those options off will save me 3K and 0.5K in space, respectively.  I am not seeing any change in size to my uClibc library.

My .config files are indeed correct.

% cd toolchain_build_arm/uClibc-0.9.29
% grep MESSAGES .config
# UCLIBC_HAS_ERRNO_MESSAGES is not set
# UCLIBC_HAS_SIGNUM_MESSAGES is not set


% cd toolchain/uClibc
% grep MESSAGES uClibc-0.9.29.config
# UCLIBC_HAS_ERRNO_MESSAGES is not set
# UCLIBC_HAS_SIGNUM_MESSAGES is not set

% cd toolchain_build_arm/uClibc-0.9.29/lib
% strings libuClibc-0.9.29.so   (this command spits out a bunch of text, including the following...)
...
Operation not permitted
No such file or directory
No such process
Interrupted system call
Input/output error
No such device or address
Argument list too long
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081014/90a91f59/attachment.htm 
