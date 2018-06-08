From: Stefan Becker <chemobejk@gmail.com>
Date: Fri, 8 Jun 2018 14:40:10 +0300
Subject: [Buildroot] [PATCHv2 proposal/next 2/3] build: replace
 host-mkpasswd with host-busybox
In-Reply-To: <69845f53-8c5f-910a-58b2-57bf5c0e38e3@mind.be>
References: <20180601125900.26400-1-chemobejk@gmail.com>
 <20180601133053.27552-1-chemobejk@gmail.com>
 <20180601133053.27552-3-chemobejk@gmail.com>
 <48945091-d169-18ba-31d0-a51c64e9a918@mind.be>
 <935950713.1169230.1528197779003.JavaMail.zimbra@datacom.com.br>
 <20180605161546.GE2503@scaer>
 <CALURroS4t3V6GWnZSs6GEcAFrf1=KvfU036dskH6aEM4fQXn8w@mail.gmail.com>
 <20180605165039.GA29058@scaer> <69845f53-8c5f-910a-58b2-57bf5c0e38e3@mind.be>
Message-ID: <CAOJ2eMeFnmAdFiiCePrAAh0tQQnk7L42VLN5MUy7CHitop2prw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, All,

On Fri, Jun 8, 2018 at 12:29 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  So, not whois, not busybox, not openssl... What about python, which we anyway
> require to be installed on the host? I remember that someone has posted a
> one-liner that would do the job :-P

Because a python one-liner is not enough. F.ex. from support/scripts/mkuser:

   # Encode a password
   encode_password() {
       local passwd="${1}"

       mkpasswd -m "${PASSWD_METHOD}" "${passwd}"
   }

i.e. you need at least a python script with mkpasswd-compatible
command line parameters.

Regards, Stefan
