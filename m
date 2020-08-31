From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 31 Aug 2020 22:20:40 +0200
Subject: [Buildroot] [PATCH 1/3] package/libupnp18: security bump to
 version 1.14.0
In-Reply-To: <87h7sibmjb.fsf@dell.be.48ers.dk>
References: <20200821204139.3682940-1-fontaine.fabrice@gmail.com>
 <ee168046-5a2e-537c-8df2-9c4fd00bb757@mind.be>
 <CAPi7W81om-PW5JrYCtD05NXrUXgDUEh-XAJyv4onO-vtSTjj3A@mail.gmail.com>
 <87h7sibmjb.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W81pMcWP57ieR+1c0nknUMez=mi6th5wDnZKBCP5Q_w_mA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 31 ao?t 2020 ? 22:14, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > Le dim. 30 ao?t 2020 ? 20:34, Arnout Vandecappelle <arnout@mind.be> a ?crit :
>  >>
>  >>
>  >>
>  >> On 21/08/2020 22:41, Fabrice Fontaine wrote:
>  >> > Fix CallStranger a.k.a. CVE-2020-12695 as well as CVE-2020-13848
>  >>
>  >> Again, although this bump indeed fixes those issues, it's a feature version
>  >> bump so I'm not sure if it can be called "security bump".
>  >>
>  >> In addition, the libupnp18 package exists because of API incompatibility with
>  >> 1.6. Are we sure that this problem doesn't repeat itself for 1.14?
>  > There is indeed an API incompatibility between 1.8 and 1.14 related to
>  > CallStranger a.k.a. CVE-2020-12695: starting from 1.14, UpnpInit
>  > function has been removed as this function can't be fixed against
>  > CallStranger because this function takes an IP address and not an
>  > interface name.
>  > However, UpnpInit2 is available for more than 10 years and is used by
>  > most of the applications (i.e. mpd and vlc) with the exception of
>  > gmrender-resurrect (which is patched in this serie).
>  > As soon as libupnp 1.14 is available, I'm planning to update the
>  > applications that are still using the legacy libupnp 1.6.x version
>  > (i.e. igd2-for-linux and ushare) and drop this unsecure version.
>  > I would like to avoid adding a third version of libupnp (i.e. a
>  > libupnp114 package) as from a security perspective, all packages
>  > should use this version.
>
> So we would end up with package/libupnp = 1.14.0? Sounds sensible.
Yes ideally, we should have package/libupnp = 1.14.0. Would it be
acceptable/reasonable to bump libupnp from 1.6.x to 1.14.x and remove
libupnp18?
If this is acceptable, I'll send a v2 of this serie (with the drop of
libupnp18 and the update of ushare/igd2-for-linux).
>
>  > Still, I agree that this is not only a "security bump" so I would
>  > advise to apply this serie to next and backport it to our LTS branches
>  > in a few months.
>
> Ok. I was still hesitating if I should apply this for 2020.08, but I
> think you are right - Lets get 2020.08 out the door, merge next and let
> this stabilize a bit before backporting to 2020.08.x / 2020.02.x.
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
