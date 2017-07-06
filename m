From: Robert Smigielski <ptdropper@gmail.com>
Date: Thu, 6 Jul 2017 17:57:25 -0400
Subject: [Buildroot] question on setting file ownership after boot
In-Reply-To: <6aec27d6-22ea-9ce7-014b-443736d98fda@mind.be>
References: <CABWt4evLAk_=Nr3ktrPj-NEArjBaicmNkMxAoDk7HNmHe9LSug@mail.gmail.com>
 <46798e49-c7f0-ac8e-5906-6ff898a6b261@mind.be>
 <CABWt4ev4w1MpUOJtkVxOPG3Ry8M9JqnGEAD92ygyQdxap3k5ow@mail.gmail.com>
 <6aec27d6-22ea-9ce7-014b-443736d98fda@mind.be>
Message-ID: <CABWt4esKF=XwvacF=9iLBETKUy9xyQLNsdRM0evaOdCU1XbyOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone.  I found the root cause and successfully corrected the file
ownership problem. I noticed that the network manager build configuration
includes the option --with-dbus-user=dbus so I changed it from dbus to root
and did a clean then make. Runtime testing shows all files owned by root
not user "1000" now. All is well.

On Jul 1, 2017 3:38 AM, "Arnout Vandecappelle" <arnout@mind.be> wrote:

>
>
> On 30-06-17 22:27, Robert Smigielski wrote:
> > Thank you for the clarification.
> >
> > Now that I thought about it some more my question really is why are a
> bunch of
> > directories and files owned by user dbus up on boot up? I'm trying to
> find what
> > causes that to happen so that I can change that to be user root.
>
>  Those are probably files created at runtime by either systemd or dbus.
>
>  Regards,
>  Arnout
>
> [snip]
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170706/10b52eba/attachment.html>
