From: Patrick Mochel <patrick.mochel@timesys.com>
Date: Wed, 13 May 2020 14:09:27 -0700
Subject: [Buildroot] Adding post image hook
In-Reply-To: <20200513221628.42c07184@windsurf.home>
References: <20200511175027.71ed1d22@windsurf.home>
 <ea-mime-5ebc52f4-7a9b-60b07d84@www-1.mailo.com>
 <20200513221628.42c07184@windsurf.home>
Message-ID: <CAFV4z9Y6QvY=Ds2sw6U27fSnrcVeKJ0a9p8-nZhHZS+Mua3fEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, May 13, 2020 at 1:16 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:


> Or alternatively, you can do just:
>
>   make printvars
>

FWIW, This doesn't generate any output.

As I mentioned in my previous email, you can do e.g.:

$ make printvars VARS="%" > printvars-plain.mk

.. which does generate +/- the desired output of _everything_, but it also
results in this in the shell:

make: support/dependencies/check-host-.sh: Command not found


.. with the result (only as an aside) of this:

$ wc -l printvars-plain.mk && ls -sh printvars-plain.mk
307705 printvars-plain.mk
31M printvars-plain.mk

All things considered, it's not that big of a deal in terms of size, but it
does also include all of the expanded macros; e.g. 'define
inner-kconfig-package', of which I'll spare the list the full text and
leave it as an exercise to the reader. ;-)

Those are all appended to the list of package (and other component)
variables; i.e. right after this last package variable:

ZZIPLIB_VERSION=0.13.69

.. and this makes parsing the bulk slightly problematic -- there are ~30k
lines of generated make functions with interspersed blank lines that are
irrelevant to package (or other component) variables.

In the end, this is just FYI. If you have suggestions of how one might
improve on this, I'm all ears and might even look into rectifying it..

Cheers,


Patrick
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200513/e126c432/attachment.html>
