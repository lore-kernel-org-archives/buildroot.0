From: Stefan Becker <chemobejk@gmail.com>
Date: Sun, 16 Dec 2018 17:33:48 +0200
Subject: [Buildroot] [PATCH RESEND] core: enhance printvars for
 variables with newlines
In-Reply-To: <20181216161430.1752d2f0@windsurf.home>
References: <CAOJ2eMdEHvZeJ6rECyRkzMZN0UYJ2CYK4yMgR9d89P%2B-tWYJYw@mail.gmail.com>
 <20180416115855.26762-1-chemobejk@gmail.com>
 <fc8f1cc6-e9ba-9cfe-df4a-4b80792d6434@mind.be>
 <CAOJ2eMc+3Bx40nWF=VALh6JzeaNVWPekyCGXAL2=a_YX4yJWug@mail.gmail.com>
 <20181216145427.0274aed5@windsurf.home>
 <CAOJ2eMcWOj2gvGWHNoZm3ofz2O=LjGj7F02Gy73RyiYP7Pvcmg@mail.gmail.com>
 <20181216161430.1752d2f0@windsurf.home>
Message-ID: <CAOJ2eMdF2qZL6yFenfO6xVeZxf_gBgBejQ=PX6HpcEvs26pRCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Dec 16, 2018 at 5:14 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> You did not answer my question: why didn't you use features of
> Buildroot such as "make <pkg>-build" or "make <pkg>-rebuild" ?

That would require the buildroot source tree to be available. Plus
adding all internal components, even the ones that have nothing to
with buildroot and do not use any of its host build tools, to the
buildroot meta build system for buildroot build to recognize the
generated build artefacts.

> How in practice you were using those commands extracted from Buildroot
> variables to achieve "modular builds" ?

That depends on the module, e.g.

* buildroot: output/target/, host/ plus selected buildroot meta build
system source files required for flash image build + module install
script
* kernel: output from modules_install & install + module install script
* ... (you get the picture)

But definitely no source code is included in the module build
artefact. All internal components have been removed from buildroot
meta build system, i.e. buildroot module build only builds components
included in its component list, i.e. buildroot module build only needs
to be executed after pulling changes from upstream.

Regards, Stefan
