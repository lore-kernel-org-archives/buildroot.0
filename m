From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Tue, 22 Nov 2016 14:09:05 +0100
Subject: [Buildroot] [PATCH 1/1] host-python: Really do not use the
 system OpenSSL.
In-Reply-To: <f01041c6-2cd5-3aee-94b9-b743f9836bd7@mind.be>
References: <43b2e7d1-6366-3d98-89f1-d2ab7ca3db2c@green-communications.fr>
 <20161117150649.5568-1-nicolas.cavallari@green-communications.fr>
 <2c158563-8cb5-f271-68e6-3c173bd2f3b1@mind.be>
 <770975c2-bae0-897c-a798-5fe5df84c016@green-communications.fr>
 <f01041c6-2cd5-3aee-94b9-b743f9836bd7@mind.be>
Message-ID: <515ff5e8-2077-f5e9-52eb-7e061b48203a@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/11/2016 17:43, Arnout Vandecappelle wrote:
>> I was trying to minimize the amount of lines changed. I assume this
>> patch is not going to be applied upstream.
> 
>  I don't see a reason why not, it adds an enable/disable option to the set they
> already have. Thomas, did you ever try to send it upstream?
> 
>  By the way, any idea why we don't have this for python3? setup.py seems to be
> identical...

It isn't. Python 3's setup.py compiles the internal hash
implementation unconditionally. There is, however, no --disable-ssl
passed/implemented by buildroot. So I'll just add a patch that adds it
and nothing else.
