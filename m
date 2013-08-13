From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Aug 2013 07:36:17 +0200
Subject: [Buildroot] [PATCH] infra: display current task as title of the
 term window
In-Reply-To: <CAAXf6LWCBh-W3nHRLtoXVy8PfbS3NpOQ7sMwicp6W+kv-OeAkg@mail.gmail.com>
References: <1375822004-22591-1-git-send-email-francois.perrad@gadz.org>
 <CAAXf6LWCBh-W3nHRLtoXVy8PfbS3NpOQ7sMwicp6W+kv-OeAkg@mail.gmail.com>
Message-ID: <5209C5D1.7040904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/08/13 08:44, Thomas De Schampheleire wrote:
> Hi Fran?ois,
>
> On Tue, Aug 6, 2013 at 10:46 PM, Francois Perrad <fperrad@gmail.com> wrote:
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>   package/pkg-utils.mk |    3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>> index 15db096..8572cb1 100644
>> --- a/package/pkg-utils.mk
>> +++ b/package/pkg-utils.mk
>> @@ -64,7 +64,8 @@ INFLATE.xz   = $(XZCAT)
>>   INFLATE.tar  = cat
>>
>>   # MESSAGE Macro -- display a message in bold type
>> -MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
>> +MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)" && \
>> +              echo -e "\033]2;$($(PKG)_NAME) $($(PKG)_VERSION) $(1)\007"
>>   TERM_BOLD  := $(shell tput smso)
>>   TERM_RESET := $(shell tput rmso)
>
> Although I like the idea, it does not work for me. I'm running Linux
> Mint, with a Konsole terminal. The above does nothing at all. I also
> tried manually:
>
> echo -ne "\033]0;something\007"
>
> but it doesn't change a thing.
> It does work in gnome-terminal. I haven't tested in other situations.
>
> Could you have a look at Konsole?
>
> I know that Gentoo has this feature for its portage package
> installation/compilation tool. When you run 'emerge', the titles are
> constantly updated with the package that is being handled, also in
> Konsole. You may be able to find out what the 'right way' is based on
> their sources.

  Are you sure this works for you with emerge? I RTFM'ed it and according 
to the konsole manual, you have to add '%w' to the tab title string to 
get the string set by the shell. Perhaps Gentoo simply sets the default 
tab title string to something including %w.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
