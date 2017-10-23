From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Mon, 23 Oct 2017 08:47:18 -0400
Subject: [Buildroot] [PATCH] support/download: print dl hash if not
 provided
In-Reply-To: <c473939d-e763-165f-5451-cd940f56fa38@mind.be>
References: <20170720031836.977-1-gael.portay@savoirfairelinux.com>
 <20170910092955.GD3536@scaer>
 <20170911191208.at72rz23a7y25nvj@gportay>
 <c473939d-e763-165f-5451-cd940f56fa38@mind.be>
Message-ID: <20171023124718.zsdv7exoc3j2guim@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Oct 23, 2017 at 11:10:32AM +0200, Arnout Vandecappelle wrote:
>  Hi Ga?l,
> 
> On 11-09-17 21:12, Ga?l PORTAY wrote:
> > Yann,
> > 
> > On Sun, Sep 10, 2017 at 11:29:55AM +0200, Yann E. MORIN wrote:
> >> Ga?l, All,
> >>
> >> On 2017-07-19 23:18 -0400, Ga?l PORTAY spake thusly:
> >>> ...
> >>>
> >>> It also fixes check_one_hash description. check_one_hash() takes three
> >>> arguments:
> >>>  - algo hash
> >>>  - known hash
> >>>  - file to hash
> >>>
> >>> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> >>
> >> NAK from me.
> >>
> >> The reason we do not want this is that we instead want the user to go
> >> fetch the hash(es) as provided by upstream, like in an announcement
> >> email, or in an on-the-side hash file.
> >>
> >> Having the download infra print the locally computed hash defeats the
> >> very purpose of hashes: check that we get what upstream provides.
> >>
> >> We only accept local calculations of hashes for the cases where upstream
> >> does not provide any (or too weak) hash.
> >>
> > 
> > Okay.
> 
>  Thomas and I discussed this at the BR developer meeting, and we disagree with
> Yann that we should make life difficult for people bumping a package :-P. So we
> think this patch does have value. Would you be willing to respin it?
> 

For sure. Let me do a rebase and I will respin it at the end of the day.

>  However, the text you propose is not strong enough. How about:
> 
>        Please find a hash in the upstream announcement or website
>        and add it to ${h_file}
>        If upstream doesn't provide a hash and the source is trusted,
>        consider adding these lines:
> 

I agree.

>  Also, the most annoying thing actually is that when the hash is wrong, the
> just-downloaded file will be removed again. It would be convenient to avoid
> removing it, similar to how it is done when the file exists already.
> 

I was thinking the same thing when write this patch. Let me see. I think it is
just another case to add in the download script.

Regards,
Gael
