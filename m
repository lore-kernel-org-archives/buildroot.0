From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 26 Feb 2014 08:00:15 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-02-25
In-Reply-To: <87k3cigt81.fsf@dell.be.48ers.dk>
References: <20140226073009.06EDD100CEF@stock.ovh.net>
 <87k3cigt81.fsf@dell.be.48ers.dk>
Message-ID: <530DC93F.3060205@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/26/2014 05:42 AM, Peter Korsgaard wrote:
>  >    powerpc |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/2862eba84c0922f19dbc2c7babcf15dbc137af93/
> 
> C++ issue? Gustavo?
> 
> ./src/fs/Path.hxx:61:29: error: invalid return type 'Path' of constexpr function 'static constexpr Path Path::Null()'
> ./src/fs/Path.hxx:69:47: error: invalid return type 'Path' of constexpr function 'static constexpr Path Path::FromFS(Path::const_pointer)'

Same toolchain as...

>  >    powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/88d76be91d04a22dd2f1683396a172be085e1657/
> 
> Internal compiler error. Thomas, how old is this ctng toolchain?

It's a 4.6.0 gcc, mpd requires at least 4.6 so the check passes, however
being a .0 i don't feel very confident about it not getting some bug
triggered.
It's probably worth upgrading to a new and internal toolchain for
e500v2, i regularly use it without issues and old toolchain components
where somewhat fragile about it.

>  >    powerpc |              xlib_libXau-1.0.8 | NOK | http://autobuild.buildroot.net/results/f62f8e63082fdfb9a68c8b4e629e5a7fa02b3bba/
> 
> Out of memory?
> 
> configure: creating ./config.status
> ./config.status: fork: Cannot allocate memory

Very likely that the build machine was too busy at that moment.

>  >       bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/0bf4621fad59fb0a42ae42b0a9d71e16ec49c617/
> 
> atomics missings, perhaps we should mark it as !bfin?

We need the GCC version checks, this is another "too old gcc" issue
which is just a problem with the analog toolchain (should work with the
internal if the internal works, anybody tested that on real hardware?).
Regards.
