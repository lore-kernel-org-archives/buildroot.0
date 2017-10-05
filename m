From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 5 Oct 2017 15:00:36 +0200
Subject: [Buildroot] [PATCH v3] HOST_DIR/lib: symlink respectively to
 lib32/64
In-Reply-To: <CANQCQpZBooKow=5hX_m++Eqfee9o9R6rczRHkxXO_MtjxagS+w@mail.gmail.com>
References: <1507120908-48104-1-git-send-email-matthew.weber@rockwellcollins.com>
 <78e41d61-c2f5-1e7f-0e45-66b497f8bff6@mind.be>
 <CANQCQpZBooKow=5hX_m++Eqfee9o9R6rczRHkxXO_MtjxagS+w@mail.gmail.com>
Message-ID: <021206e6-be3c-4489-0913-47a229954f37@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-10-17 23:28, Matthew Weber wrote:
> Arnout,
> 
> On Wed, Oct 4, 2017 at 3:37 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  Hi Matt,
>>
>> On 04-10-17 14:41, Matt Weber wrote:

[snip]
>>> +$(HOST_DIR)/lib: $(HOST_DIR)
>>> +     @mkdir -p $@
>>> +     case $(HOSTARCH) in \
>>
>>  Better put @ in front here.
>>
>>> +             (*64) ln -s lib $(@D)/lib64;; \
> 
> So like the following but not the ln lines?  I'm not completely sure
> on how @ would work with a case statement.
>     @case $(HOSTARCH) in \
>             (*64) ln -s lib $(@D)/lib64;; \
>             (*)   ln -s lib $(@D)/lib32;; \
>      esac

 Yes indeed. The @ is taken away by make, the rest of the line (which in this
case is 4 lines because of the \) is passed to shell and interpreted there. Make
syntax is quite crazy :-)


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
