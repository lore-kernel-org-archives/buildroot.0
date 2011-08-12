From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 12 Aug 2011 12:01:46 +0200
Subject: [Buildroot] Python standard library problems
In-Reply-To: <4E444173.3090509@fosstel.com>
References: <4E42D99C.7080806@fosstel.com>
 <4E42FCAB.2070609@in-2-technology.co.uk> <4E43D5B4.2090106@fosstel.com>
 <4E43F72C.4060005@in-2-technology.co.uk> <4E441E25.4010600@fosstel.com>
 <4E444173.3090509@fosstel.com>
Message-ID: <4E44FA0A.1000902@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

With the following config, I have the same problem that Pedro encountered.

When you look closer to the build output, when building python, at the
end of the process, you have :

Failed to build these modules:
_bisect            _codecs_iso2022    _collections
_csv               _ctypes            _ctypes_test
_elementtree       _functools         _heapq
_hotshot           _io                _json
_locale            _lsprof            _md5
_multibytecodec    _multiprocessing   _random
_sha               _sha256            _sha512
_socket            _struct            _testcapi
array              audioop            binascii
cmath              cPickle            crypt
cStringIO          datetime           dl
fcntl              future_builtins    grp
imageop            itertools          linuxaudiodev
math               mmap               operator
ossaudiodev        parser             resource
select             spwd               strop
syslog             termios            time
unicodedata

Which is a *lot* of modules. It might be "normal" for some of them, like
ossaudiodev which is likely to have an unmet dependency, but note that
all three modules Pedro have mentionned are here.
Some of them are deprecated too, like imageop.

It would be ideal if we could manage to drop the number of failed build
modules to 0.

I'll try to look into it.

Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: .config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110812/d0a68980/attachment-0001.ksh>
