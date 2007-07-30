From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 30 Jul 2007 21:36:08 +0200
Subject: [Buildroot] --includedir=/usr/include
	vs	--includedir=(STAGING_DIR)/usr/include
In-Reply-To: <0707302103451.17391@somehost>
References: <0707302043450.17391@somehost>
	<20070730190231.GA5834@real.realitydiluted.com>
	<0707302103451.17391@somehost>
Message-ID: <20070730193608.GB27993@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 30, 2007 at 09:06:34PM +0200, Cristian Ionescu-Idbohrn wrote:
>On Mon, 30 Jul 2007, Steven J. Hill wrote:
>
>> > Noticed that some .mk files use different --includedir= configure options.
>> > Shouldn't --includedir=/usr/include be used everywhere?
>> >
>> With the recent changes that buildroot has undergone, I actually think
>> this is a good idea. Any objections to getting rid of 'include' in the
>> staging directory all together and going to 'usr/include'?
>
>That's fine with me. But my question was:
>
>  --includedir=/usr/include vs --includedir=$(STAGING_DIR)/usr/include
>                                            ^^^^^^^^^^^^^^

depending on the package --prefix=$(STAGING_DIR)/usr
is enough and all other (except, perhaps specifying the location of
$(STAGING_DIR)/etc) are not needed anymore.

There are indeed quite some packages that are not yet converted. Patches
to clean those up are very welcome.
