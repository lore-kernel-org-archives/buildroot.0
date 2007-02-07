From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 7 Feb 2007 21:24:29 +0100
Subject: [Buildroot] building ARM toolchain with nofpu
In-Reply-To: <1170878990.10007.4.camel@ndragon.eng.wgate.com>
References: <c88e466f0701311609u4896b81ehb99cb2eb01f78886@mail.gmail.com>
	<200702012015.55089.yann.morin.1998@anciens.enib.fr>
	<1170878990.10007.4.camel@ndragon.eng.wgate.com>
Message-ID: <200702072124.30009.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 07 February 2007 210, James Newell wrote:
> Has any one had any progress with building uclibc default soft float
> using gcc 4.1.1?

Yes.

Short answer: it does not work.
See: http://gcc.gnu.org/bugzilla/show_bug.cgi?id)329  [1]
(not directly related, but yet, useless on ARM).

Long answer: I've got a patch (attached) that allow building gcc-4.1.1 with
uClibc-0.9.28.1 (didn't try svn head). You have to add it to the collection
of patches provided by buildroot. Unfortunately, that doesn't give a useable
x-compiler because of [1].

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --=< ?_? >=-- ?------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
?------------------------------?-------?------------------?--------------------?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 801-softfloat-fix.patch
Type: text/x-diff
Size: 2827 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070207/e19457c3/attachment.bin 
