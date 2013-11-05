From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 5 Nov 2013 09:11:24 +0100
Subject: [Buildroot] github tarball urls: http vs https
In-Reply-To: <52781189.1030401@mind.be>
References: <CAAXf6LUToDknEUmXgK-z2LkXG6oxZ9-0WwNfq6Ub_w7Lq_TjHQ@mail.gmail.com>
 <52753AB6.20904@trzebnica.net>
 <CAAXf6LUsvpTG1-tNk5aWgR5qNgBYFu0h6a50VkrZ3r4YVviCxQ@mail.gmail.com>
 <527742F3.6070405@mind.be>
 <CAAXf6LVNCTivN=SwA7YzCzrN7QPxBsDXVG3kvLecmnswmSzqNw@mail.gmail.com>
 <52781189.1030401@mind.be>
Message-ID: <CAAXf6LVidCiakHjVzAY-sjLHCTfwLrGgP5JcbMKPWWChxQ5X0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, all,

On Mon, Nov 4, 2013 at 10:28 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 04/11/13 09:33, Thomas De Schampheleire wrote:
>>

>>>   IIRC, at some point there was a problem that a download site used a
>>> certificate signed by a recent CA that was not included in the
>>> autobuilder's
>>> trusted certificate list, so wget would not accept it. It was discussed
>>> that
>>> an option was to run wget with --no-check-certificate, but this would
>>> defeat
>>> the purpose of https so was rejected. Of course, using an http URL
>>> instead
>>> of an https has the same result.
>>
>>
>> But this seems to be a temporary problem only.
>
>
>  "Temporary" until the autobuilder's CA certificates are updated, you mean?
>

Yes, that's what I meant.

>
>> Besides, what happens in that scenario if you try http, and the server
>> redirects it to https? I would expect the certificate to fail, or does
>> wget pass an implicit --no-check-certificate in this case?
>
>
>  If it redirects, it will still fail. That's why using the https URL is
> better in that case, as I mentioned above.
>

Ok, great, so it looks like we have a plan: we implement a github
helper, and have that use https directly.

Now we need a volunteer to do this. I have no problem in doing it but
it would end up on my todo list first, so if there is anyone else who
has time, then please be my guest.

Best regards,
Thomas
