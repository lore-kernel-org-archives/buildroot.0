From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 19:52:28 +0200
Subject: [Buildroot] Java 7 (IcedTea / OpenJDK / JamVM)
In-Reply-To: <CAJtjsKZkwagH=wOECedbiEUndwdjTVXR2X+MChhxSYdnywAgsw@mail.gmail.com>
References: <CAJtjsKZkwagH=wOECedbiEUndwdjTVXR2X+MChhxSYdnywAgsw@mail.gmail.com>
Message-ID: <20150825195228.14dbfc2f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Tue, 25 Aug 2015 17:31:42 +0200, Johan Oudinet wrote:

> The way IcedTea is design, its makefile downloads the original openjdk
> archive, along with several other archives, extracts them and patches
> them. Then it builds the modified openjdk with a Java 1.5 compiler
> (gcj by default) to get a preliminary java compiler. Finally, it uses
> this bootstrap jdk to fully compile openjdk.
> 
> There is an option to disable the download of archives but you have to
> provide the location to them. I wonder how I should download such
> extra tarballs in Buildroot?

Look at <pkg>_EXTRA_DOWNLOADS. It does exactly that: download more
files, and simply store them in $(DL_DIR) without doing anything with
them.

> The other issue I'm facing is how to deactivate the X11 dependencies.
> I see that debian provides an openjdk-jre-headless package and that's
> what I would like to have in buildroot. However, debian simply
> compiles everything and omits to install the X11 part in the headless
> package. There's a blog post from a guy in the OpenEmbedded project
> that does it on a previous OpenJDK version but he actually patches
> IcedTea and OpenJDK sources:
> https://evolvis.org/plugins/mediawiki/wiki/jalimo/index.php/CrossCompilingOpenJDK
> Ideally, I would like to have the possibility to activate or not the
> graphical part of OpenJDK. Any better idea before I start a long and
> tedious process of patching IcedTea and OpenJDK?

Indeed being able to build this without building X11 would be nice.
However, before starting the tedious process of patching things, you
should make sure there is some upstream interest in merging such
patches. Indeed, we don't want to keep heavy patches in Buildroot that
have no chance of being upstream, especially for things like IcedTea
that are quite specific: if you disappear or lose interest in this
package, nobody will be able to maintain such patches.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
