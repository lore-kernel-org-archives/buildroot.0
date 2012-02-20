From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 20 Feb 2012 09:49:30 +0100
Subject: [Buildroot] Dynaminc Component System for Buildroot
In-Reply-To: <CAMkyJgCC0i5t6j+M2VefDRVx_qjaRTHfOUOgnrSc9U+aHA91XQ@mail.gmail.com>
References: <CAMkyJgCC0i5t6j+M2VefDRVx_qjaRTHfOUOgnrSc9U+aHA91XQ@mail.gmail.com>
Message-ID: <1329727770.13226.22.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, 2012-02-20 at 09:45 +0200, Avishay Orpaz wrote:

> I've been using buildroot for about two years for building embedded
> systems on various platforms. An embedded system usually comprises of
> a set of standard tool and custom software, scripts etc. Buildroot
> does great job on the first, but then I have to manually compile the
> project-specific software and install it in the target system created
> by buildroot. In order to make workflow smoother, I have an idea of
> adding a dynamic component support for buildroot. In such a system,
> buildroot, when invoked, will scan a specific directory for
> components. Components are directories with some distinguishing
> feature (a special file or so) which contains buildroot .mk file.
> Those components will appear on buildroot configuration menu, will use
> the regular compilation-installation infrastructure it provides and
> will be installed in the target filesystem as any other,
> out-of-the-box component.

What we have been doing to solve this is that we maintain a git branch
of buildroot with our components added as buildroot packages. Our
applications appear in a dedicated submenu and are built as part of the
standard buildroot process. This is similar to what you are suggesting
and it is already very easy to achieve by means of a git branch. Doing
it this way also has the advantage that it also solves the problem of
distributing your project files to co-workers as everything is kept
under version control. Changes from buildroot upstream can easily be
merged into your branch and are then also easily distributed to
co-workers and to your build system.


Regards, Sven
