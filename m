From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 11 Apr 2016 13:42:41 +0200
Subject: [Buildroot] Adding support for the Rust programming language
In-Reply-To: <570B6E61.4030403@mind.be>
References: <20160408224541.79e1ba4d@itchy> <570A77F9.50506@mind.be>
 <20160411103211.3d9a1581@free-electrons.com> <570B6A67.1000806@mind.be>
 <20160411091556.GP3364@tarshish> <570B6E61.4030403@mind.be>
Message-ID: <CAAXf6LW0k25yWLzbs=0oTj+LYUsXBKEqGEDDxfEQX6S=P2Q4KA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Apr 11, 2016 at 11:29 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 04/11/16 11:15, Baruch Siach wrote:
>>
>> Hi Arnout,
>>
>> On Mon, Apr 11, 2016 at 11:12:07AM +0200, Arnout Vandecappelle wrote:
>>>
>>>   So, if python is used, please make sure it runs on any python (with
>>> full
>>> standard library) from python2.4 (RHEL5) to python3.5. That means that
>>> using
>>> the json standard library module is not an option, since it was
>>> introduced
>>> only in python 2.6.
>>
>>
>> The manual
>> (http://nightly.buildroot.org/manual.html#requirement-mandatory)
>> currently requires Python 2.6 or newer.
>
>
>  I don't think that that's accurate. Thomas, Jan, I believe you're using
> RHEL5 with an older python, no?


We have machines on RHEL 5 and stock Python (2.4), yes. I have not
received reports of this not building for us.
But then again, which python dependency do we really have for standard builds?
Note also that we have a restricted set of packages we build, if the
python dependency is due to a specific package, then we may not see
the problem.

To generate the manual, (see docs/manual/manual.mk), there is a check
on availability of argparse, which is only standard on python 2.7 but
can be downloaded separately for python >= 2.3.

/Thomas
