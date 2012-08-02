From: Alex Bradbury <asb@asbradbury.org>
Date: Thu, 2 Aug 2012 15:53:44 +0100
Subject: [Buildroot] Package informations, online and updated
In-Reply-To: <20120802163133.7c19d637@skate>
References: <20120731213729.49c4b3ee@skate>
 <CA+wH296kBL8ZhhrHW7KCdrvFRuhB3-B=H2yJwZTyu75A8FhJyA@mail.gmail.com>
 <20120802163133.7c19d637@skate>
Message-ID: <CA+wH294hkqsmAA-KdCPuefNYkNvM6VkZj5cmxkNUjdnEZq6FxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2 August 2012 15:31, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Thu, 2 Aug 2012 15:19:15 +0100,
> Alex Bradbury <asb@asbradbury.org> a ?crit :
>
>> It would be handy to add the current version for each package. More
>> ambitiously, a variable defining a watch[1] line could be added to
>> each Makefile, and used with the Debian scripts (such as uscan) to
>> automatically detect new upstream versions.
>
> Agreed. Funnily I was almost to the point of talking about this in my
> announcement e-mail :-)
>
> How exactly are those watch lines used? I.e, which tool is capable of
> parsing them, and doing the necessary http/ftp requests to figure out
> if a newer upstream version is available?

uscan: http://manpages.debian.net/cgi-bin/man.cgi?query=uscan
http://anonscm.debian.org/gitweb/?p=devscripts/devscripts.git;a=blob;f=scripts/uscan.pl

uscan wants to find a separate 'watch' file inside a debian/ dir. It
actually looks like it might not be that hard to hack up uscan.pl so
it just takes the watch line as an argument (though it's been a number
of years since I hacked any Perl), then each package could have a
check-upstream-version target which uses the watch line defined in
that packages makefile and invokes the buildroot 'fork' of uscan.pl to
check whether a newer release is available upstream. I don't know if
any other distros have a similar sort of system, it just strikes me
there's not much point reinventing the wheel here and it's handy to be
able to just lift the watch regex from the debian/watch file for many
packages.

Alex
