From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Fri, 24 Aug 2012 13:51:38 -0400
Subject: [Buildroot]  dropbear permission denied
Message-ID: <CADiAo4JrERmenatsSkNqb8d--WduPqBXvz0862Cr-CqO2-2Txg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thomas Petazzoni wrote:

> Should we make the default 'root' password be 'root' so that it is
> non-empty and it works with Dropbear? Or simply add a FAQ entry
> which explains this problem? Other ideas?

Not being much familiar with Dropbear, I'm wondering if it supports
PAM [1]? If it does, can it work with a similar PAM config file like I
am supplying* with Busybox for login i. e.

auth      required       pam_unix.so nullok
account   required       pam_unix.so nullok
password  required       pam_unix.so nullok
session   required       pam_unix.so nullok

with such PAM config file zero-length passwords are allowed. Busybox
login works this way for users `default' and `root' but not for any
other username.

[1] http://lists.ucc.gu.uwa.edu.au/pipermail/dropbear/2010q3/001053.html

* In a patch I submitted some time earlier, but it hasn't been
committed  yet:
http://lists.busybox.net/pipermail/buildroot/2012-August/057490.html

Thanks.
-- 
Dmitry Golubovsky

Anywhere on the Web
