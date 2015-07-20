From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 20 Jul 2015 16:22:14 +0200
Subject: [Buildroot] [PATCH 1/1] angularjs: new package.
In-Reply-To: <20150720130018.GA7128@zenon.in.qult.net>
References: <1437129876-5158-1-git-send-email-ignacy.gawedzki@green-communications.fr>
 <CAGduivxBdvS75bNaHo_AmWaZZZ4x0qqbr27kVPbLrvjay05uJQ@mail.gmail.com>
 <20150720130018.GA7128@zenon.in.qult.net>
Message-ID: <CAGduivxNOLi6OodtvJj-jrfhm6K9Ek6UZ2Dx1G+8+gGn0b2Dug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ignacy, all

On Mon, Jul 20, 2015 at 3:00 PM, Ignacy Gaw?dzki
<ignacy.gawedzki@green-communications.fr> wrote:
> On Sat, Jul 18, 2015 at 05:58:48PM +0200, thus spake Maxime Hadjinlian:
>> > +ANGULARJS_VERSION = 1.4.2
>> It seems there's already a newer version on their website.
>
> You're right, I'm updating that.
>
>> > +ANGULARJS_SOURCE = angular-$(ANGULARJS_VERSION).zip
>> > +ANGULARJS_SITE = https://code.angularjs.org/$(ANGULARJS_VERSION)/
>> You are missing the LICENSE and LICENSE_FILES information here.
>
> Okay, the license is MIT, but there's no license file included in the
> archive.  Should I specify angular.js as the LICENSE_FILES instead?
Yes I think it's the way to go, that's what we do in other packages.
>
> If so, I have a small problem.  It appears that I need to specify a
> file path relative to $(@D), in that case it is simply "angular.js".
> Then the file is included as such in legal-info/license.txt during
> make angularjs-legal-info.  Meanwhile, the legal-info/manifest.csv
> file is indicating that the license file is "angular.js" to be found
> at the root of the zip archive, which is not right, since that file is
> in the angular-$(ANGULARJS_VERSION)/ subdirectory.
>
> What is the best way to go?  I'm thinking about not moving files to
> $(@D) in ANGULARJS_EXTRACT_CMDS, but that would make me use a
> subdirectory instead of $(@D) everywhere else.
I would opt for having the subdirectory everywhere.

And also, I don't know what the community think about that, but
FOO_SUBDIR could be generalized to pkg-generic instead of only
pkg-autotools ?
>
> Thanks for your help.
>
> Ignacy
>
> --
> Ignacy Gaw?dzki
> R&D Engineer
> Green Communications
