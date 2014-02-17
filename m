From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 17 Feb 2014 23:15:50 +0100
Subject: [Buildroot] [PATCH 1/2] imagemagick: disable documentation
In-Reply-To: <53027DDA.6060102@mind.be>
References: <1392508668-27561-1-git-send-email-romain.naour@openwide.fr>
 <53027DDA.6060102@mind.be>
Message-ID: <53028A16.40408@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 17/02/2014 22:23, Arnout Vandecappelle a ?crit :
> On 16/02/14 00:57, Romain Naour wrote:
>> There is no options to disable the documentation,
>> so remove it directly in Makefile.am
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>   Why is this needed?

It is not really needed, but all documentation is installed in staging 
and target,
which hides compilation issues because logs are not long enough in 
autobuilder.

http://autobuild.buildroot.net/results/612/612f2b258114cbb2c60359f19a9797c5ce8852ae/build-end.log

Then documentation is removed from target.

>   Side-track: perhaps we should add stubs for makeinfo, help2man,
> asciidoc, xmlto, docbook2*, ... in $(HOST_DIR)/usr/bin, so we can disable
> all documentation in one fell swoop.
Yes, but in the case of Imagemagick all html stuff is not generated,
it is just directly installed from the source directory.

Ok, this is probably not the best method to do this...

Best regards,
Romain Naour
