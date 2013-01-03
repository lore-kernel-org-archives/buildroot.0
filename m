From: Kaiwan Billimoria <kaiwan.billimoria@gmail.com>
Date: Thu, 3 Jan 2013 13:19:20 +0530
Subject: [Buildroot] [PATCH 0/3] Add Perf tools support
Message-ID: <CAPDLWs9E97zpsf4MnrR=61MRY08CShQz5AK+r8W2BP0dXpv=ag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi folks,

As mentioned in an earlier email, am looking to add Perf tools support to
Buildroot.
Thomas P mentioned 3 approaches to this, I feel going with the first one
(i.e. integrating the patches into the 'Kernel' menu of BR) works best (as
of now).

Of course, things will evolve..

Also, pl understand that my current patch-set is definitely not perfect;
for eg., one issue I am currently facing:
the way i've got the Makefile (linux/linux.mk) running, the 'perf' binary
executable is being built after the root filesystem is tar-red. How do I
solve this? Pl help, as I don't (yet) understand all finer details of the
BR mechanics..

Anyhow, I hope this is a positive start in getting the perf tools into BR..

I have formatted this patch-set such that this email is the "cover letter";
subsequent emails contain the actual patches. Hope this is all right..

TIA!
Kaiwan.

---
Kaiwan Billimoria (3):
  Add Perf tools support
  Add Perf tools support
  Add perf tools support: this is the kernel patch to be applied to the
    kernel      for kernel compile to go through; it basically adds a
    typedef.

 linux/Config.in  |   11 +++++++++++
 linux/linux.mk   |   21 +++++++++++++++++++++
 linux/perf.patch |   26 ++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 linux/perf.patch

-- 
1.7.10.4
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130103/04c95a7c/attachment.html>
