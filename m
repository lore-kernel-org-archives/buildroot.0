From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 7 Nov 2012 21:26:19 -0200
Subject: [Buildroot] [PATCH 1/1] qextserialport : fix download and bump
	version
In-Reply-To: <874nl1avsi.fsf@dell.be.48ers.dk>
References: <1352317186-2905-1-git-send-email-sagaert.johan@skynet.be>
 <874nl1avsi.fsf@dell.be.48ers.dk>
Message-ID: <CAExDhvZVYFjMHZvcoC4MAMjWS+cyaPt33tBNfFvtA9GavXc54A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 7, 2012 at 8:32 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>
> >>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:
>
>  Sagaert> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
>
> Thanks, but it still doesn't build with a base Qt config here as it
> tries to link with QtGui / QtNetwork, which imho doesn't make much sense
> for a serial lib.
>

It's quite likely one of the examples being built.
The changeset removes a patch that removes the examples, but you don't
actually have to do that, you can build from within src and the .pro
in there will most likely have a line with QT -= gui, just like the
QtSerialPort package I sent a while back.

The toplevel .pro file tells qmake that those listed folders should be
built and each contain a .pro file inside that matches the folder
name. It will simply iterate thru them and call qmake over them.
Those "subprojects" contain the actual description of how to build the
project, which qmake reads.
