From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 8 Mar 2020 13:50:08 -0600
Subject: [Buildroot] [PATCH 1/1] package/connman: enable wireguard
In-Reply-To: <87blp6u2wu.fsf@dell.be.48ers.dk>
References: <20200308070741.42542-1-james.hilliard1@gmail.com>
 <20200308144746.6cbfbd8f@windsurf.home> <20200308173718.GA2885265@x230>
 <87blp6u2wu.fsf@dell.be.48ers.dk>
Message-ID: <CADvTj4rNT=-oCZriKYn92420q_xjtK0Ri+99D-QLie3XhcHL2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 8, 2020 at 12:17 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:
>
> Hi,
>
>  >> > +config BR2_PACKAGE_CONNMAN_WIREGUARD
>  >> > + bool "enable wireguard support"
>  >> > + select BR2_PACKAGE_LIBMNL
>
>  >> We already had a patch from Petr at
>  >> http://patchwork.ozlabs.org/patch/1246181/ to add Wireguard support,
>  >> but he was also selecting BR2_PACKAGE_WIREGUARD_TOOLS.
>
>  >> Could you or Petr clarify this ?
>  > configure.ac
>  > found_libmnl="no"
>  > if (test "${firewall_type}" = "nftables" -o \
>  >              "${enable_wireguard}" != "no"); then
>  >      PKG_CHECK_MODULES(LIBMNL, [libmnl >= 1.0.0], [found_libmnl="yes"],
>  >              AC_MSG_ERROR([libmnl >= 1.0.0 not found]))
>  >      AC_SUBST(LIBMNL_CFLAGS)
>  >      AC_SUBST(LIBMNL_LIBS)
>  > fi
>  > AM_CONDITIONAL(LIBMNL, test "${found_libmnl}" != "no")
>
>  > IMHO this means that libmnl is required for nftables and wireguard.
>
> Yes. What about wireguard-tools? Are they used by connman or does it
> directly talk the netlink protocol? I guess the latter given the libmnl
> dependency?
Yeah, connman seemed to build fine with wireguard support without
wireguard-tools.
>
> --
> Bye, Peter Korsgaard
