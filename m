From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 22 Jun 2016 17:38:58 -0400
Subject: [Buildroot] [PATCH 1/1] fs/tar: support passing long options to
	tar
In-Reply-To: <189e4068-b3b3-3152-b99b-9727f2f9485e@mind.be>
References: <1466464689-29532-1-git-send-email-fhunleth@troodon-software.com>
 <189e4068-b3b3-3152-b99b-9727f2f9485e@mind.be>
Message-ID: <CA+-urNQVggor83ZSWLq2zAUtd2i88=TaLYMsKSQ2TMFED+j8GA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Jun 22, 2016 at 5:20 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 21-06-16 01:18, Frank Hunleth wrote:
>> This change modifies how options are passed to tar to support long
>> options. Unfortunately, it breaks configurations that previously used
>> this feature. Before the change, options were passed using the
>> single-letter without a '-' form. E.g., if the user wanted to turn on
>> verbose output, they would have to specify 'v'. With this change, the
>> user would need to pass '-v'. The help text is updated to make the
>> requirement more clear.
>
>  I may be mistaken, but wouldn't we conserve full backward compatibility by using
>
>         tar $(TAR_OPTS) -cf ...

I got confused since tar's man page looks like it wants the "operation
mode" parameter first. Your proposal works for the options that I want
to use, though. I'll update my patch.

Thanks,
Frank
