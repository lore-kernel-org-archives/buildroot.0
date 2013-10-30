From: Wojciech Zabolotny <wzab01@gmail.com>
Date: Wed, 30 Oct 2013 01:00:11 +0100
Subject: [Buildroot] [PATCH v3 1/1] jack2: new package
In-Reply-To: <20131029203433.563d6ced@skate>
References: <1256826d-31b9-4b85-8834-35694e372fac@email.android.com>
 <1382658143-3850-1-git-send-email-wzab01@gmail.com>
 <1382744168-14259-1-git-send-email-wzab01@gmail.com>
 <20131027181024.14201db4@skate>
 <1382903456-5996-1-git-send-email-wzab01@gmail.com>
 <20131028202748.3d03c78f@skate>
 <1383072946-4851-1-git-send-email-wzab01@gmail.com>
 <20131029203433.563d6ced@skate>
Message-ID: <CAMduVEeEUoQYiixi9J0REN5cFZhv=tfimD8ObrFaktmNuEd+cQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Yes, you are right. Unfortunately there is no single file with
licensing information in jack sources themselves.
Checking of individual files seems to be very inefficient.
Can we rely on information published on this website:
http://jackaudio.org/files/docs/html/index.html ?

Quoting from there:

License

Copyright (C) 2001-2011 by Paul Davis, Stephane Letz, Jack O'Quinn,
Torben Hohn and others.

JACK is free software; you can redistribute it and/or modify it under
the terms of the GNU GPL and LGPL licenses as published by the Free
Software Foundation, <http://www.gnu.org>. The JACK server uses the
GPL, as noted in the source file headers. However, the JACK library is
licensed under the LGPL, allowing proprietary programs to link with it
and use JACK services. You should have received a copy of these
Licenses along with the program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
USA.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
General Public License for more details.

So finally I'd propose:
JACK2_LICENSE = LGPLv2.1+ (jack library),  GPLv2+ (other components)
is it possible to specify
JACK2_LICENSE_SITE = http://jackaudio.org/files/docs/html/index.html
instead of JACK2_LICENSE_FILE  (as such file doesn't seem to exist in sources).

Regards,
Wojtek


On Tue, Oct 29, 2013 at 8:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Wojciech M. Zabolotny,
>
> On Tue, 29 Oct 2013 19:55:45 +0100, Wojciech M. Zabolotny wrote:
>
>> +JACK2_LICENSE = LGPLv2.1+
>
> I didn't notice until now, but this license specification doesn't seem
> to be correct. For example,
> https://github.com/jackaudio/jack2/blob/master/linux/alsa/JackAlsaAdapter.cpp
> is under GPLv2+. Parts of jack2 seem to be under LGPL, some other parts
> under GPL. It should be explained in the <pkg>_LICENSE specification,
> with something just as (purely invented example, I haven't analyzed
> jack2) :
>
> FOO_LICENSE = GPLv2+ (this part and this part), LGPLv2.1+ (this other part)
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Wojciech M. Zabo?otny
My GPG/PGP keys:
standard: B191 ACF0 7909 83FA 3F9B  450C 407E 3C4B 4569 D119
confidential: 2BF3 F90F 6EA8 7D35 59FD  5080 78ED 33DE 1312 D8F8
