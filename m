From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Oct 2017 11:10:32 +0200
Subject: [Buildroot] [PATCH] support/download: print dl hash if not
 provided
In-Reply-To: <20170911191208.at72rz23a7y25nvj@gportay>
References: <20170720031836.977-1-gael.portay@savoirfairelinux.com>
 <20170910092955.GD3536@scaer> <20170911191208.at72rz23a7y25nvj@gportay>
Message-ID: <c473939d-e763-165f-5451-cd940f56fa38@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Ga?l,

On 11-09-17 21:12, Ga?l PORTAY wrote:
> Yann,
> 
> On Sun, Sep 10, 2017 at 11:29:55AM +0200, Yann E. MORIN wrote:
>> Ga?l, All,
>>
>> On 2017-07-19 23:18 -0400, Ga?l PORTAY spake thusly:
>>> ...
>>>
>>> It also fixes check_one_hash description. check_one_hash() takes three
>>> arguments:
>>>  - algo hash
>>>  - known hash
>>>  - file to hash
>>>
>>> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
>>
>> NAK from me.
>>
>> The reason we do not want this is that we instead want the user to go
>> fetch the hash(es) as provided by upstream, like in an announcement
>> email, or in an on-the-side hash file.
>>
>> Having the download infra print the locally computed hash defeats the
>> very purpose of hashes: check that we get what upstream provides.
>>
>> We only accept local calculations of hashes for the cases where upstream
>> does not provide any (or too weak) hash.
>>
> 
> Okay.

 Thomas and I discussed this at the BR developer meeting, and we disagree with
Yann that we should make life difficult for people bumping a package :-P. So we
think this patch does have value. Would you be willing to respin it?

 However, the text you propose is not strong enough. How about:

       Please find a hash in the upstream announcement or website
       and add it to ${h_file}
       If upstream doesn't provide a hash and the source is trusted,
       consider adding these lines:


 Also, the most annoying thing actually is that when the hash is wrong, the
just-downloaded file will be removed again. It would be convenient to avoid
removing it, similar to how it is done when the file exists already.

 Regards,
 Arnout

> 
>> As an aside, this patch does two things: fix the comment for
>> check_one_hash() and print the hash. It should be split.
>>
> 
> I will send a patch for this tiny nitpick.
> 
> Regards,
> Ga?l
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
