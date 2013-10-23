From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 23 Oct 2013 21:23:34 +0200
Subject: [Buildroot] Tool to check packages updates
In-Reply-To: <CACjG4BJtk-JxzUGmJn9urrMGMjkcwtmMxRys_FGrY761H1zQzA@mail.gmail.com>
References: <CACjG4BJq5TXvpMAoU7w3JgTVrOGHpeKng88HU03Rf_=XunPKAQ@mail.gmail.com>
 <CAAXf6LW1c32E_BFwbD6JKMCRKWtCw4r7pc9xuj3_DPsGyjL=SA@mail.gmail.com>
 <CACjG4B+7riHKmXG0Oo3cZxrWFygTBojSTHRktuYvz0eeMJ0ttQ@mail.gmail.com>
 <526809E4.30203@mind.be>
 <CACjG4BJtk-JxzUGmJn9urrMGMjkcwtmMxRys_FGrY761H1zQzA@mail.gmail.com>
Message-ID: <CAAXf6LV9pBCwsqrtm6LJxiO1oaYX4afBv0tHPgOqVReV058GTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Oct 23, 2013 at 8:58 PM, arnaud aujon <arnaud.aujon@gmail.com> wrote:
> Well, you're right, see the script bellow.
> What need to be done is evaluate variable PACKAGE_SITE and PACKAGE_VERSION,
> for the moment it doesn't evalute things like
> PACKAGE_VERSION = $(VERSION_MAJOR).xx so I need to write a small recursive
> function to retrieve the real value.
> I also need to work on package source hosted with a CVS (mainly git and
> svn).
>

make knows exactly how to evaluate such variables, so instead of
trying to do this from a script, isn't it possible to use the output
of 'make printvars' ? This prints _all_ the relevant variables but you
could filter on _SOURCE or _SITE to get what you need and base your
script on that.

Best regards,
Thomas
