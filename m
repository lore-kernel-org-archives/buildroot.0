From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 21 Jan 2014 11:09:07 -0500
Subject: [Buildroot] Problem with multi interface support in udhcpc
	script?
In-Reply-To: <CANxTyt6sZiRD7SgdnYeshPG4gma_m21gyiYOUP9=MP1dLOL7Sg@mail.gmail.com>
References: <CANxTyt44suVoSpVTivmKde77P7fUYRa04a_fQfb=ceA-Yym9sQ@mail.gmail.com>
 <87fvohimha.fsf@dell.be.48ers.dk>
 <CANxTyt6sZiRD7SgdnYeshPG4gma_m21gyiYOUP9=MP1dLOL7Sg@mail.gmail.com>
Message-ID: <CANxTyt77jOkBpAvmZiHmPAGGeae0p4YWC7_8XUs9xgYK2YGjsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 21, 2014 at 10:23 AM, Danomi Manchego
<danomimanchego123@gmail.com> wrote:
>         TMPFILE=$(mktemp)
>         grep -vE "# $interface\$" $RESOLV_CONF > $TMPFILE
>         sed -i '/^search /d' $RESOLV_CONF

That sed line should have been:

sed -i '/^search /d'  $TMPFILE

Danomi -
