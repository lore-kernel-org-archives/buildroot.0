From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 11 Oct 2013 16:13:50 +0200
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <52558865.8070804@mind.be>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
 <CAAXf6LVxoXMaBFVzc6Hd46ST8AwDOyd8PdRfJ04WKfF9po_K9w@mail.gmail.com>
 <525556CE.3000308@lucaceresoli.net> <52558865.8070804@mind.be>
Message-ID: <CAAXf6LWh4pO-x37LdqhtxTTL=H_exF=xYQfUkZ46Sq=-n1fORA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 9, 2013 at 6:46 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 10/09/13 15:14, Luca Ceresoli wrote:
>>>
>>> Related to this is the question of a license URL. I personally think
>>> it is not legally safe to only refer to a URL from a package, because
>>> who knows someone changes the license text on the URL. They could just
>>> alter the license of existing sources.
>>> So although the feature of automatically downloading a license text
>>> from its URL looks nice, I (not a lawyer) would not recommend
>>> implementing it. I follow ThomasP's reasoning of requesting upstream
>>> to add the effective license text to the sources, and in the meantime
>>> using the magic value decided above for case (b).
>>
>>
>> I agree with you. Regarding the legal stuff we should stay on the safe
>> side. But Arnout and Simon expressed an opposite opinion on another
>> branch of this thread...
>
>
>  If the package specifies that the license is available at a specific URL,
> then that is the license, right? It is true that the license may change
> unexpectedly, but to make sure it stays consistent we should download the
> license at the same time that the source is downloaded (which could be
> tricky, I admit).

So here we have a choice between:
a. adding a feature in buildroot to download the license from a URL,
working around an upstream problem
b. warning the user at the time of legal-info, and at the same time
contacting upstream and asking them to fix their source package
(including the license text).

While a. may seem nice for the buildroot user, it is not really
solving the bigger problem, IMO.

In fact, there are so many open-source projects that don't properly indicate:
- which license the project falls under
- what the authors really expect with respect to licensing
So ideally we try to change that for some of these projects.

Best regards,
Thomas
