From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 May 2016 22:26:04 +0200
Subject: [Buildroot] About python2 and python3
In-Reply-To: <5730F02E.6040806@gmail.com>
References: <5730F02E.6040806@gmail.com>
Message-ID: <20160509222604.25fa27a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 9 May 2016 22:16:46 +0200, Marco Trapanese wrote:

> if python2 is selected is not possible to add python3.
> But python2 and python3 are quite different and sometimes is useful to 
> have both. i cannot deselect python2 because is selected by another package.

We currently do not support building both Python 2 and Python 3.

The main reason is that we allow building external Python modules, and
it would be very annoying with Kconfig to allow the user to tell which
modules should be built/installed for Python 2, which modules should be
built/installed for Python 3, and which modules should be
built/installed for both.

One possibility would be to install all of them for both Python 2 and
Python 3, but that's very inefficient.

So, I think we'll stick with just supporting the installation of either
Python 2 or Python 3. I'd rather recommend you to see why you need
Python 2 at all, and try to see if you can make that part work with
Python 3.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
