From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 12:06:59 +0200
Subject: [Buildroot] [RFC PATCH v5 07/11] support/scripts: add
 reloacte-sdk.sh script for SDK relocation
In-Reply-To: <CAHXCMML7nZOMjV6uicBB9szFnDFZ2b1ryQWhY8bcs1aTPrtOUQ@mail.gmail.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-8-git-send-email-wg@grandegger.com>
 <778420e1-443a-355e-e2ac-edc3f91aa2d3@mind.be>
 <5d1f1a6e-084f-7530-0bdd-c2239b8bc47c@grandegger.com>
 <CAHXCMML7nZOMjV6uicBB9szFnDFZ2b1ryQWhY8bcs1aTPrtOUQ@mail.gmail.com>
Message-ID: <4262a106-bcb5-cb1d-0fc8-07ea21d82b59@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 09:14, Samuel Martin wrote:
> Wolfgang,
> 
> On Tue, Jul 4, 2017 at 9:01 AM, Wolfgang Grandegger <wg@grandegger.com> wrote:
>>
>> Am 04.07.2017 um 00:01 schrieb Arnout Vandecappelle:
>>>
>>>   Type in the subject: reloacte -> relocate
>>>
>>> On 30-06-17 10:37, Wolfgang Grandegger wrote:
> [...]
>>>> +newpath="$(sed -e "s\\${OLDPATH}\\${NEWPATH}\\g" "${LOCFILE}")"
>>>
>>>
>>>   \\ is a bit a weird sed separator... We use % mostly, sometimes @ or ,.
>>> But I'd
>>> advise %.
>>
>>
>> "%" and "@" are legal character of a file name. That's why I have chosen
>> "\".
> 
> I think youcan choose one of the characters from [1] (my preference
> would be either ':' or '|').
> 
> [1] https://en.wikipedia.org/wiki/Filename#Reserved_characters_and_words

 Not a great reference. The only characters that are not allowed in Unix path
names are / and \0. Neither of them is usable for the sed replacement.

 However, Buildroot will break down if the output dir contains strange
characters. Admittedly the external toolchain dir is probably more robust. But
we already have plenty of sed replacements using % and some with @ or , or :.

 So I've discussed it here at the Summer Camp and basically everyone has a
different opinion. Since this patch is basically ready to go in (after fixing up
the type in the subject), whoever commits it will replace the \\ with their
preference.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
