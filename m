From: Jorge Ventura <jorge.araujo.ventura@gmail.com>
Date: Thu, 14 Mar 2013 14:07:48 -0500
Subject: [Buildroot] =?windows-1252?q?=91=5F=5Fctype=5Ftouplow=5Ft=92_and_?=
	=?windows-1252?q?=91=5F=5Fctype=5Fmask=5Ft=92_does_not_name_a_type?=
Message-ID: <CAJEG_NdqCrS=ny=BMgF4n8ui5kavmOxtWyzMvxe-_97e=wRPTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to compile one code and I am getting the following errors:

buildroot-2013.02/output/host/usr/lib/gcc/i586-buildroot-linux-uclibc/4.6.3/../../../../i586-buildroot-linux-uclibc/include/c++/4.6.3/i586-buildroot-linux-uclibc/bits/ctype_base.h:47:19:
*error: ?__ctype_touplow_t? does not name a type*

buildroot-2013.02/output/host/usr/lib/gcc/i586-buildroot-linux-uclibc/4.6.3/../../../../i586-buildroot-linux-uclibc/include/c++/4.6.3/i586-buildroot-linux-uclibc/bits/ctype_base.h:51:13:
*error: ?__ctype_mask_t? does not name a type*

Taking a look in the source ctype_base.h I found the comment:

namespace std _GLIBCXX_VISIBILITY(default)
{
_GLIBCXX_BEGIN_NAMESPACE_VERSION

  /// @brief  Base class for ctype.
  struct ctype_base
  {
    *// Note: In uClibc, the following two types depend on configuration.*

    // Non-standard typedefs.
    typedef const __ctype_touplow_t* __to_type;

    // NB: Offsets into ctype<char>::_M_table force a particular size
    // on the mask type. Because of this, we don't use an enum.
    typedef __ctype_mask_t      mask;
    static const mask upper     = _ISupper;
    static const mask lower     = _ISlower;
    static const mask alpha     = _ISalpha;

It seems that something is missing in my uClibc configuration that cause
the two types be undefined or another include is missing in the code that I
am trying to compile.

Someone has any clue about this problem?

Thank you.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130314/8ae45925/attachment.html>
