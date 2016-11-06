From: Henrique Marks <henrique.marks@datacom.ind.br>
Date: Sun, 6 Nov 2016 10:13:36 -0200 (BRST)
Subject: [Buildroot] [PATCH 2/3] test/support/download/git: new test
In-Reply-To: <43363991-9d33-1b7c-7279-948cc2c1b2f3@mind.be>
References: <20161101193354.8716-1-ricardo.martincoski@datacom.ind.br>
 <20161101193354.8716-2-ricardo.martincoski@datacom.ind.br>
 <43363991-9d33-1b7c-7279-948cc2c1b2f3@mind.be>
Message-ID: <248515227.4438489.1478434416837.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All

----- Mensagem original -----
> De: "Arnout Vandecappelle" <arnout@mind.be>
> Para: "ricardo martincoski" <ricardo.martincoski@datacom.ind.br>, buildroot at buildroot.org
> Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
> Enviadas: S?bado, 5 de novembro de 2016 23:24:14
> Assunto: Re: [Buildroot] [PATCH 2/3] test/support/download/git: new test

> On 01-11-16 20:33, Ricardo Martincoski wrote:
>> This test assumes:
>> - it is run from the buildroot base dir;
>> - there is a ssh server installed;
>> - there is a key pair to allow the current user to ssh to localhost
>>   without being prompted for a password;
>> - there is no ./.config ./stdout ./package/package;
>> 
>> For each testcase, it creates a new git repo, and then download from
>> this repo using a fake package named 'package'.
> 
> I've given comments on this patch which I think are important, so I've marked
> it as Changes Requested in patchwork. However, patch 3/3 can be committed
> without this one.
> 
> Regards,
> Arnout
> 
>> 

Regarding the test comments, i think that part of the proposal is to show the tests written in Given-When-Then format without using nothing more than python and unittest class. Using GWT, it becomes easier to separate the pre-conditions, the operations to be tested, and the results. I think GWT exposes this nicely.

But, i must say that we (at Datacom) accepts both formats to tests, because there are cases where a tabular format is easier, and using GWT is just cumbersome. For instance, testing (ssh, sftp, https) connections is tabular, there is no preparation, and the operation and result comes together.

Another advantage of GWT here is to serve as an example. As buildroot is discussing test infra-structure, the GWT git tests are useful as an example on how to do it with GWT, python and unittest.

Thanks all.


-- 
Dr. Henrique Marks
henrique.marks at datacom.ind.br
R. Am?rica, 1000 - Eldorado do Sul - RS
CEP: 92990-000 - Brasil
Fone: +55 51 3933 3000 - Ramal 3466
