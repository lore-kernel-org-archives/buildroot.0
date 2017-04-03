From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 13:01:49 +0200
Subject: [Buildroot] libintl static linking issues - yet another spin
In-Reply-To: <66e02263-8faf-0601-e3ba-18501de7c6ef@mind.be>
References: <20170326235320.448e802a@free-electrons.com>
 <db756f2e-3dda-2fcc-6035-3287b88acf29@mind.be>
 <20170328222525.005b27bb@free-electrons.com>
 <66e02263-8faf-0601-e3ba-18501de7c6ef@mind.be>
Message-ID: <20170403130149.6ccffe4e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

[ Not read/thought about the entire e-mail yet, but just one point ]

On Mon, 3 Apr 2017 12:42:21 +0200, Arnout Vandecappelle wrote:

>  However, thinking a bit more about it: if libintl support disappears from
> uClibc-ng

What makes you think libintl disappears from uClibc-ng? uClibc-ng has
recently *added* libintl support.

Basically, today we have the following situation:

 * glibc comes with its own libintl implementation, which is
   full-featured

 * uClibc-ng until recently did not have any libintl implementation, so
   we are building the libintl from gettext to get a libintl
   implementation. uClibc-ng has recently added a stub libintl
   implementation, which does not support translation, i.e it's really
   just a stub.

 * musl has a libintl implementation. It is not a stub, and seems to
   support translation (i.e it seems to read .mo files for
   translations, etc.).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
