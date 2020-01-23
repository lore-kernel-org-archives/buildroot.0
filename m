From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Jan 2020 23:23:13 +0100
Subject: [Buildroot] [PATCH v2,
 2/4] package/celt051: needs dynamic library
In-Reply-To: <CAPi7W80KMHAyKyHmmkHKZuyfQLyA5+cifwhdVp54PjwwK+8FtA@mail.gmail.com>
References: <20191117164452.5361-1-fontaine.fabrice@gmail.com>
 <20191117164452.5361-2-fontaine.fabrice@gmail.com>
 <871rtyyapg.fsf@dell.be.48ers.dk>
 <CAPi7W80KMHAyKyHmmkHKZuyfQLyA5+cifwhdVp54PjwwK+8FtA@mail.gmail.com>
Message-ID: <069a1277-e9bc-c297-4da3-a89cd776c79c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/11/2019 17:05, Fabrice Fontaine wrote:
> Dear Peter,
> 
> Le sam. 23 nov. 2019 ? 14:38, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>>
>>>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>>
>>  > celt051 can't be built statically with opus as opus embeds its own celt
>>  > version. So add a dynamic library dependency to celt051 (and not to
>>  > opus, as celt051 is only used optionally by spice whereas opus is
>>  > selected by 9 packages)
[snip]
>> Care to send a patch doing something like that? Thanks.
> An other option would be to remove celt051 package indeed the root
> cause of this static build failure is that celt has been merged into
> the IETF Opus codec and is now obsolete (see http://celt-codec.org/).

 Indeed, that makes more sense. Care to remove it? Legacy handling should select
BR2_PACKAGE_OPUS then (with appropriate explanation).

 Yann is developer for celt051, so please give a peep if it can't be removed.

 Regards,
 Arnout
