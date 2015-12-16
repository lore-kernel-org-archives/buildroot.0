From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 16 Dec 2015 11:26:29 +0000
Subject: [Buildroot] [PATCH 1/3] package/nodejs: Add version 5.2.0
In-Reply-To: <1450132540.4928.24.camel@embedded.rocks>
References: <1450122295-5311-1-git-send-email-martin@barkynet.com>
 <20151214210913.227563c9@free-electrons.com>
 <CAFGQKxfvQwA3v8W=OKEvNR6SE06DTng6PxQGj4q7o4zUWYbU2g@mail.gmail.com>
 <20151214214337.2933ea41@free-electrons.com> <20151214211045.GA4152@free.fr>
 <1450132540.4928.24.camel@embedded.rocks>
Message-ID: <56714A65.80301@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

On 14/12/15 22:35, J?rg Krause wrote:
> On Mo, 2015-12-14 at 22:10 +0100, Yann E. MORIN wrote:
>> Thomas, All,
>>
>> On 2015-12-14 21:43 +0100, Thomas Petazzoni spake thusly:
>>> On Mon, 14 Dec 2015 20:24:30 +0000, Martin Bark wrote:
>>>> I'm not sure the answer to that.  What i can say is that all four
>>>> are
>>>> getting maintained.  Also, according to https://github.com/nodejs
>>>> /LTS
>>>> node.js 0.10.x will be maintained all the way until October 2016.
>>>>
>>>> I see two logical approaches for buildroot:
>>>>
>>>> 1) Support all four in buildroot because node.js support all four
>>>> 2) Only Support the 4.x and 5.x because they are the current LTS
>>>> and
>>>> Stable releases (i.e. the ones on the front page of
>>>> https://nodejs.org)
>>>>
>>>> Personally I'd vote for 2) because it simplifies things.
>>>>
>>>> What are your thoughts?
>>>
>>> I'm fine with option (2) as well, but do we have other NodeJS users
>>> that would like to see 0.10.x and 0.12.x being kept?
>>>
>>> Is there any issue for users of 0.10.x/0.12.x to migrate to 4.2 or
>>> 5.2 ?
>>
>> We do have the various version of nodejs, because:
>>
>>   - 4.2.x needs gcc >= 4.8 and armv6+
>>   - 0.12.x needs armv6+
>>   - 0.10.x has not requirement
>>
>> Going back in our history:
>>
>>   - we had nodejs-0.10
>>   - someone proposed to bump to 0.12
>>   - someone else wanted to keep 0.10 around because of armv6+
>>     requirement
>>   - so we added 0.12, and kept 0.10
>>   - the story repeated itself with 4.2.x
>>
>> So, I think we have a few options here:
>>
>>  1) keep all the three existing versions, add 5.2
>>  2) keep 0.10 and 0.12, replace 4.2 with 5.2
>>  3) keep 0.10, ditch 0.12, replace 4.2 with 5.2
>>  4) dith 0.10 and 0.12, replace 4.2 with 5.2
>>
>> I would lean toward either 2 or 3.
>>
>> 3 is IMHO the best solution: 5.2 is the best choice when all the
>> conditions are met; 0.10 is the fallback, maybe not the optimum in
>> case 0.12 would have fit, but since that's a fallback I don't think
>> it matters much...
>>
> 
> As 4.x is a LTS release I would not drop it for the 5.x release.
> 
> I would keep all the three version we have - they are all still
> maintained and v0.12 and v4 are both even LTS releases.
> 
> New versions are often not compatible with older versions of Node.js -
> it's similiar to Lua.
> 
> So I would lean toward 1.

I agree with you. Dropping a LTS version doesn't look good to me. We
could do it when it's not maintained anymore. Right now I vote for
keeping the three versions we already have plus adding the 5.2.0 because
is the new stable: option 1.

Regards,

Vincent.
